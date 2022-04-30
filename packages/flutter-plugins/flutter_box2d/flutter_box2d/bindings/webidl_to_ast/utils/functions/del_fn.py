from enum import Enum
from utils.utils import lower_first, upper_first, not_supported_yet

class Context(Enum):
  DEFAULT = 0 # default context, ie no context has been supplied
  RET = 1 # return type
  FN_ARG = 2 # function arg types
  CTR_ARG = 3 # constructor arg types

class DelFunction:
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

  def render(self, sig, raw_sig):
    self.setupArgs(sig)
    self.setupCall(raw_sig)
    if(self.constructor):
      maybe_from = ('.from%s' % self.num_args) if self.num_args != 0 else ''
      return '\n\t%s%s(%s);\n' % (self.names.del_class_name, maybe_from, self.ctr_args) #  : super(token: _token)
    else:
      maybe_comment = '//' if not_supported_yet(sig) else ''
      maybe_arg_count = ('%s' % self.num_args) if self.overload else ''
      return '\n\t%s%s %s%s(%s);' % (maybe_comment, type_to_del(self.interfaces, self.enums, self.return_type), dartify_call(self.names.dart_func_name), maybe_arg_count, self.fn_args)
  
  def setupArgs(self, sig):
    self.fn_arg_types = list(map(lambda s: type_to_del(self.interfaces, self.enums, s, False, Context.FN_ARG), sig))
    self.fn_args = ', '.join(['%s %s' % (self.fn_arg_types[j], self.args[j]) for j in range(self.num_args)])
    self.ctr_arg_types = list(map(lambda s: type_to_del(self.interfaces, self.enums, s, False, Context.CTR_ARG), sig))
    self.ctr_args = ', '.join(['%s %s' % (self.ctr_arg_types[j], self.args[j]) for j in range(self.num_args)])
  
  def setupCall(self, raw_sig):
    self.call_args = ', '.join(['%s%s' % ('*' if raw_sig[j].getExtendedAttribute('Ref') else '', self.args[j]) for j in range(self.num_args)])

def dartify_call(text):
  if (text == '__destroy__'): return 'dispose'
  prefix = ''
  # if text.startswith('set_'):
  #   prefix = 'set '
  #   text = text.replace('set_', '')
  return prefix + lower_first(text)

def type_to_del(interfaces, enums, t, non_pointing=False, context=Context.DEFAULT):
  # print 'to del ', t
  def base_type_to_del(t):
    if t == 'Long':
      ret = 'int'
    elif t == 'UnsignedLong':
      ret = 'int'
    elif t == 'LongLong':
      ret = 'int'
    elif t == 'UnsignedLongLong':
      ret = 'int'
    elif t == 'Short':
      ret = 'int'
    elif t == 'UnsignedShort':
      ret = 'int'
    elif t == 'Byte':
      ret = 'int'
    elif t == 'Octet':
      ret = 'int'
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
      ret = (interfaces[t].getExtendedAttribute('Prefix') or [''])[0] + upper_first(t) +'Platform'
      if(context == Context.FN_ARG): ret = 'covariant %s' % ret # add covariant to delegates.dart function args - to avoid type errors for args in ffi.dart
    elif t in enums:
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
  return prefix + base_type_to_del(t) + suffix
