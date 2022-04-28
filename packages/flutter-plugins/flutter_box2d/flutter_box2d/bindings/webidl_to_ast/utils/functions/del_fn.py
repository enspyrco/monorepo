from enum import Enum
from utils.utils import lower_first, not_supported_yet

class Context(Enum):
  DEFAULT = 0 # default context, ie no context has been supplied
  RET = 2 # return type
  FN_ARG = 3 # function arg types
  CTR_ARG = 4 # constructor arg types

class DelFunction:
  def __init__(self, interfaces, args, i, const, constructor, names, return_type):
    self.interfaces = interfaces
    self.args = args
    self.arg_num = i
    self.const = const
    self.constructor = constructor
    self.names = names
    self.return_type = return_type

  def render(self, sig, raw_sig):
    self.setupArgs(sig)
    self.setupCall(raw_sig)
    if(self.constructor):
      maybe_from = ('.from%s' % self.arg_num) if self.arg_num != 0 else ''
      return '\n\t%s%s(%s) : super(token: _token);\n' % (self.names.del_class_name, maybe_from, self.ctr_args)
    else:
      maybe_comment = '//' if not_supported_yet(sig) else ''
      return '\n\t%s%s %s(%s);' % (maybe_comment, type_to_del(self.interfaces, self.return_type), dartify_call(self.names.dart_func_name), self.fn_args)
  
  def setupArgs(self, sig):
    self.fn_arg_types = list(map(lambda s: type_to_del(self.interfaces, s, False, Context.FN_ARG), sig))
    self.fn_args = ', '.join(['%s %s' % (self.fn_arg_types[j], self.args[j]) for j in range(self.arg_num)])
    self.ctr_arg_types = list(map(lambda s: type_to_del(self.interfaces, s, False, Context.CTR_ARG), sig))
    self.ctr_args = ', '.join(['%s %s' % (self.ctr_arg_types[j], self.args[j]) for j in range(self.arg_num)])
  
  def setupCall(self, raw_sig):
    self.call_args = ', '.join(['%s%s' % ('*' if raw_sig[j].getExtendedAttribute('Ref') else '', self.args[j]) for j in range(self.arg_num)])

def dartify_call(text):
  if (text == '__destroy__'): return 'dispose'
  prefix = ''
  if text.startswith('set_'):
    prefix = 'set '
    text = text.replace('set_', '')
  return prefix + lower_first(text)

def type_to_del(interfaces, t, non_pointing=False, context=Context.DEFAULT):
  # print 'to del ', t
  def base_type_to_del(t):
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
      ret = 'void'
    elif t == 'String':
      ret = 'char*'
    elif t == 'Float':
      ret = 'double'
    elif t == 'Double':
      ret = 'double'
    elif t == 'Boolean':
      ret = 'bool'
    elif t == 'Any' or t == 'VoidPtr':
      ret = 'void*'
    elif t in interfaces:
      ret = (interfaces[t].getExtendedAttribute('Prefix') or [''])[0] + t[0].upper() + t[1:] +'Platform'
      if(context == Context.FN_ARG): ret = 'covariant %s' % ret # add covariant to delegates.dart function args - to avoid type errors for args in ffi.dart
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
  return prefix + base_type_to_del(t) + suffix
