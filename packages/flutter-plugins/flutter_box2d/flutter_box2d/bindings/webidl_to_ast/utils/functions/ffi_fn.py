from enum import Enum
from utils.utils import lower_first

class Context(Enum):
  DEFAULT = 0
  NATIVE_RET = 1
  NATIVE_ARG = 2
  DART_RET = 3
  DART_ARG = 4

class FfiFunction:
  def __init__(self, interfaces, args, i, const, constructor, names, return_type):
    self.interfaces = interfaces
    self.args = args
    self.arg_num = i
    self.const = const
    self.constructor = constructor
    self.names = names
    self.return_type = return_type

  def render(self, sig, min_args, max_args, raw_sig):
    self.setupArgs(sig)
    self.setupBody(min_args, max_args)
    self.setupCall(raw_sig)
    maybe_from = ('.from%s' % self.arg_num) if self.arg_num != 0 else ''
    if(self.constructor):
      ctr_type_native = 'Pointer<Void> Function(%s)' % self.joined_arg_types_native
      ctr_type_dart = 'Pointer<Void> Function(%s)' % self.joined_arg_types_dart
      ffi_lookup = '\n\tstatic final _ctr%s = _symbols.lookup<NativeFunction<%s>>(\'%s\').asFunction<%s>();\n' % (self.arg_num, ctr_type_native, self.c_names[self.arg_num], ctr_type_dart)
      dart_adapter = '\n\t%s%s(%s) : _self = _ctr%s(%s);\n' % (self.names.dart_class_name+'FfiAdapter', maybe_from, self.ffi_args, self.arg_num, self.call_args_ffi)
      return ffi_lookup + dart_adapter
    else:
      maybe_comma = ', ' if self.arg_num > 0 else ''
      func_sig_native = '%s Function(Pointer<Void>%s%s)' % (self.return_type_native, maybe_comma, self.joined_arg_types_native)
      func_sig_dart = '%s Function(Pointer<Void>%s%s)' % (self.return_type_dart, maybe_comma, self.joined_arg_types_dart)
      lookup = '\n\tstatic final _%s = _symbols.lookup<NativeFunction<%s>>(\'%s\').asFunction<%s>();\n' % (self.names.dart_func_name, func_sig_native, self.c_names[self.arg_num], func_sig_dart)

      func_str = '\n\t@override\n\t%s %s(%s) => ' % (self.return_type, dartify_call(self.names.dart_func_name), self.ffi_in_args)
      # If the function returns an object of the same type as the class we assume it is returning a Pointer<Void> and we wrap it (This is quite hacky but seeing if we can get away with it)
      if self.return_type == self.names.dart_class_name+'FfiAdapter':
        func_str += '%sFfiAdapter._(_%s(_self%s%s));\n' % (self.names.dart_class_name, self.names.dart_func_name, maybe_comma, self.call_args_ffi)
      else:
        func_str += '_%s(_self%s%s);\n' % (self.names.dart_func_name, maybe_comma, self.call_args_ffi)
      return lookup + func_str
  
  def setupArgs(self, sig):
    ffi_in_arg_types = list(map(lambda s: type_to_ffi(self.interfaces, s, False), sig))
    self.ffi_in_args = ', '.join(['%s %s' % (ffi_in_arg_types[j], self.args[j]) for j in range(self.arg_num)])
    self.ffi_arg_types = list(map(lambda s: type_to_ffi(self.interfaces, s, False, context=Context.DART_ARG), sig))
    self.ffi_args = ', '.join(['%s %s' % (self.ffi_arg_types[j], self.args[j]) for j in range(self.arg_num)])
    self.arg_types_native = list(map(lambda s: type_to_ffi(self.interfaces, s, False, Context.NATIVE_ARG), sig))
    self.joined_arg_types_native = ', '.join(['%s' % (self.arg_types_native[j]) for j in range(self.arg_num)])
    self.arg_types_dart = list(map(lambda s: type_to_ffi(self.interfaces, s, False, Context.DART_ARG), sig))
    self.joined_arg_types_dart = ', '.join(['%s' % (self.arg_types_dart[j]) for j in range(self.arg_num)])
    self.return_type_native = type_to_ffi(self.interfaces, self.return_type, False, Context.NATIVE_RET)
    self.return_type_dart = type_to_ffi(self.interfaces, self.return_type, False, Context.DART_RET)
    self.return_type = type_to_ffi(self.interfaces, self.return_type)

  def setupBody(self, min_args, max_args):
    call_prefix = 'return '
    body = ''
    pre_arg = []
    call_postfix = ''
    cache = ('getCache(%s)[this.ptr] = this;' % self.names.class_name) if self.constructor else ''

    self.c_names = {}
    for i in range(min_args, max_args):
      self.c_names[i] = 'dart_bind_%s_%d' % (self.names.bindings_name, i)
      body += '  if (%s === undefined) { %s%s(%s)%s%s }\n' % (self.args[i], call_prefix, '_' + self.c_names[i], ', '.join(pre_arg + self.args[:i]), call_postfix, '' if 'return ' in call_prefix else '; ' + (cache or ' ') + 'return')
    self.c_names[max_args] = 'dart_bind_%s_%d' % (self.names.bindings_name, max_args)
    body += '  %s%s(%s)%s;\n' % (call_prefix, '_' + self.c_names[max_args], ', '.join(pre_arg + self.args), call_postfix)
    if cache:
      body += '  ' + cache + '\n'
  
  def setupCall(self, raw_sig):
    self.call_args_ffi = ', '.join(['%s%s' % (self.args[j], '._self' if raw_sig[j].getExtendedAttribute('Ref') else '') for j in range(self.arg_num)])

def dartify_call(text):
  if (text == '__destroy__'): return 'dispose'
  prefix = ''
  if text.startswith('set_'):
    prefix = 'set '
    text = text.replace('set_', '')
  return prefix + lower_first(text)

def type_to_ffi(interfaces, t, non_pointing=False, context=Context.DEFAULT):
  # print 'to ffi', t
  def base_type_to_ffi(t):
    if t == 'Long':
      ret = 'int'
    elif t == 'UnsignedLong':
      ret = 'unsigned int'
    elif t == 'LongLong':
      ret = 'long long'
    elif t == 'UnsignedLongLong':
      ret = 'unsigned long long'
    elif t == 'Short':
      ret = 'short'
    elif t == 'UnsignedShort':
      ret = 'unsigned short'
    elif t == 'Byte':
      ret = 'char'
    elif t == 'Octet':
      ret = 'unsigned char'
    elif t == 'Void':
      if(context==Context.NATIVE_RET or context==Context.NATIVE_ARG):
        ret = 'Void'
      else:
        ret = 'void'
    elif t == 'String':
      ret = 'char*'
    elif t == 'Float':
      if(context==Context.NATIVE_RET or context==Context.NATIVE_ARG):
        ret = 'Float'
      else:
        ret = 'double'
    elif t == 'Double':
      ret = 'double'
    elif t == 'Boolean':
      if(context==Context.NATIVE_RET or context==Context.NATIVE_ARG):
        ret = 'Bool'
      else:
        ret = 'bool'
    elif t == 'Any' or t == 'VoidPtr':
      ret = 'void*'
    elif t in interfaces:
      ret = (interfaces[t].getExtendedAttribute('Prefix') or [''])[0] + t[0].upper() + t[1:] 
      if(context == Context.DEFAULT): ret += 'FfiAdapter'
      else: ret = 'Pointer<Void>'
    else:
      ret = t
    return ret

  t = t.replace(' (Wrapper)', '')

  prefix = ''
  suffix = ''
  if '[]' in t:
    t = t.replace('[]', '')
    suffix = '*'
  if 'const ' in t:
    t = t.replace('const ', '')
  return prefix + base_type_to_ffi(t) + suffix