from enum import Enum
from utils.utils import upper_first, lower_first, not_supported_yet

# The various contexts, shown in place in the output:
# static final lookup_func = _symbols.lookup<NativeFunction<NATIVE_RET Function(NATIVE_ARGS)>>('...').asFunction<DART_RET Function(DART_ARGS)>();
#	@override
#	RET func(ARGS) => call_func(CALL_ARGS);
class Context(Enum):
  DEFAULT = 0
  NATIVE_RET = 1
  NATIVE_ARG = 2
  DART_RET = 3
  DART_ARG = 4
  RET = 5

class FfiFunction:
  def __init__(self, interfaces, enums, args, i, const, constructor, overload, names, return_type):
    self.interfaces = interfaces
    self.enums = enums
    self.args = args
    self.num_args = i
    self.const = const
    self.constructor = constructor
    self.overload = overload
    self.names = names
    self.return_type = return_type

  def render(self, sig, min_args, max_args, raw_sig):
    self.setupArgs(sig)
    self.setupBody(min_args, max_args)
    self.setupCall(raw_sig)
    maybe_from = ('.from%s' % self.num_args) if self.num_args != 0 else ''
    if(self.constructor):
      ctr_type_native = 'Pointer<Void> Function(%s)' % self.joined_arg_types_native
      ctr_type_dart = 'Pointer<Void> Function(%s)' % self.joined_arg_types_dart
      ffi_lookup = '\n\tstatic final _ctr%s = _symbols.lookup<NativeFunction<%s>>(\'%s\').asFunction<%s>();\n' % (self.num_args, ctr_type_native, self.c_names[self.num_args], ctr_type_dart)
      dart_adapter = '\n\t%s%s(%s) : _self = _ctr%s(%s);\n' % (self.names.dart_class_name+'FfiAdapter', maybe_from, self.ffi_in_args, self.num_args, self.call_args)
      return ffi_lookup + dart_adapter
    else:
      maybe_comma = ', ' if self.num_args > 0 else ''
      maybe_arg_count = ('%s' % self.num_args) if self.overload else ''

      func_sig_native = '%s Function(Pointer<Void>%s%s)' % (self.return_type_native, maybe_comma, self.joined_arg_types_native)
      func_sig_dart = '%s Function(Pointer<Void>%s%s)' % (self.return_type_dart, maybe_comma, self.joined_arg_types_dart)
      lookup = '\n\tstatic final _%s%s = _symbols.lookup<NativeFunction<%s>>(\'%s\').asFunction<%s>();' % (self.names.dart_func_name, maybe_arg_count, func_sig_native, self.c_names[self.num_args], func_sig_dart)
      
      func_str = '\n\t@override\n\t%s %s%s(%s) => ' % (self.return_type_func, dartify_call(self.names.dart_func_name), maybe_arg_count, self.ffi_in_args)
      # If the function returns an object of the same type as the class we assume it is returning a Pointer<Void> and we wrap it (This is quite hacky but seeing if we can get away with it)
      if self.return_type in self.interfaces:
        wrapper = (self.interfaces[self.return_type].getExtendedAttribute('Prefix') or [''])[0] + upper_first(self.return_type)
        func_str += '%sFfiAdapter._(_%s%s(_self%s%s))' % (wrapper, self.names.dart_func_name, maybe_arg_count , maybe_comma, self.call_args)
      else:
        func_str += '_%s%s(_self%s%s)' % (self.names.dart_func_name, maybe_arg_count, maybe_comma, self.call_args)
      maybe_convert = '.to%s();\n' %(upper_first(self.return_type)) if self.return_type in self.enums else ';\n'
      func_str += maybe_convert

      not_supported = not_supported_yet(sig)
      maybe_open_comment = '/*' if not_supported else ''
      maybe_close_comment = '*/\n' if not_supported else ''
      return maybe_open_comment + lookup + func_str + maybe_close_comment
  
  def setupArgs(self, sig):
    ffi_in_arg_types = list(map(lambda s: type_to_ffi(self.interfaces, self.enums, s, False), sig))
    self.ffi_in_args = ', '.join(['%s %s' % (ffi_in_arg_types[j], self.args[j]) for j in range(self.num_args)])
    self.ffi_arg_types = list(map(lambda s: type_to_ffi(self.interfaces, self.enums, s, False, context=Context.DART_ARG), sig))
    self.ffi_args = ', '.join(['%s %s' % (self.ffi_arg_types[j], self.args[j]) for j in range(self.num_args)])
    self.arg_types_native = list(map(lambda s: type_to_ffi(self.interfaces, self.enums, s, False, Context.NATIVE_ARG), sig))
    self.joined_arg_types_native = ', '.join(['%s' % (self.arg_types_native[j]) for j in range(self.num_args)])
    self.arg_types_dart = list(map(lambda s: type_to_ffi(self.interfaces, self.enums, s, False, Context.DART_ARG), sig))
    self.joined_arg_types_dart = ', '.join(['%s' % (self.arg_types_dart[j]) for j in range(self.num_args)])
    self.return_type_native = type_to_ffi(self.interfaces, self.enums, self.return_type, False, Context.NATIVE_RET)
    self.return_type_dart = type_to_ffi(self.interfaces, self.enums, self.return_type, False, Context.DART_RET)
    self.return_type_func = type_to_ffi(self.interfaces, self.enums, self.return_type, False, Context.RET)

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
    # we may want to check if the type is a reference type with "if raw_sig[j].getExtendedAttribute('Ref')"
    self.call_args = ', '.join(['%s%s%s' % (self.args[j], '._self' if raw_sig[j].type.name in self.interfaces else '', '.index' if raw_sig[j].type.name in self.enums else '') for j in range(self.num_args)])


def dartify_call(text):
  if (text == '__destroy__'): return 'dispose'
  prefix = ''
  # if text.startswith('set_'):
  #   prefix = 'set '
  #   text = text.replace('set_', '')
  return prefix + lower_first(text)

def type_to_ffi(interfaces, enums, t, non_pointing=False, context=Context.DEFAULT):
  # print 'to ffi', t
  def base_type_to_ffi(t):
    if t == 'Long':
      if(context==Context.NATIVE_RET or context==Context.NATIVE_ARG):
        ret = 'Int32'
      else:
        ret = 'int'
    elif t == 'UnsignedLong':
      if(context==Context.NATIVE_RET or context==Context.NATIVE_ARG):
        ret = 'Uint32'
      else:
        ret = 'int'
    elif t == 'LongLong':
      if(context==Context.NATIVE_RET or context==Context.NATIVE_ARG):
        ret = 'Int64'
      else:
        ret = 'int'
    elif t == 'UnsignedLongLong':
      if(context==Context.NATIVE_RET or context==Context.NATIVE_ARG):
        ret = 'Uint64'
      else:
        ret = 'int'
    elif t == 'Short':
      if(context==Context.NATIVE_RET or context==Context.NATIVE_ARG):
        ret = 'Int16'
      else:
        ret = 'int'
    elif t == 'UnsignedShort':
      if(context==Context.NATIVE_RET or context==Context.NATIVE_ARG):
        ret = 'Uint16'
      else:
        ret = 'int'
    elif t == 'Byte':
      if(context==Context.NATIVE_RET or context==Context.NATIVE_ARG):
        ret = 'Int8'
      else:
        ret = 'int'
    elif t == 'Octet':
      if(context==Context.NATIVE_RET or context==Context.NATIVE_ARG):
        ret = 'Uint8'
      else:
        ret = 'int'
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
      ret = (interfaces[t].getExtendedAttribute('Prefix') or [''])[0] + upper_first(t) 
      if(context == Context.DEFAULT or context==Context.RET): ret += 'FfiAdapter'
      else: ret = 'Pointer<Void>'
    elif t in enums:
      if(context==Context.NATIVE_RET or context==Context.NATIVE_ARG):
        ret = 'Int32'
      elif(context==Context.DART_RET or context==Context.DART_ARG):
        ret = 'int'
      else:
        ret = upper_first(t)
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