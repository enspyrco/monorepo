from enum import Enum
from utils.utils import not_supported_yet, upper_first, lower_first

# Each function looks like (with context in CAPPITALS)
# return_type FN_NAME(fn_args) => CALL_NAME(call_args)
class Context(Enum):
  DEFAULT = 0 # default context, ie no context has been supplied
  RET = 1 # return type
  FN_ARG = 2 # function arg types
  CTR_ARG = 3 # constructor arg types
  FN_NAME = 4
  CALL_NAME = 5

class DecFunction:
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
    maybe_from = ('.from%s' % self.num_args) if self.num_args != 0 else ''
    if(self.constructor):
      return '\n\t%s%s(%s) : _delegate = FlutterBox2DPlatform.instance.%s_%s(%s);\n' % (self.names.dart_class_name, maybe_from, self.ctr_args, self.names.class_name, self.num_args, self.call_args)
    else:
      maybe_comment = '//' if not_supported_yet(sig) else ''
      maybe_arg_count = ('%s' % self.num_args) if self.overload else ''
      maybe_ret_type = '' if self.names.attr_type == 'set' else type_to_dec(self.interfaces, self.enums, self.return_type)+' '
      maybe_params = '' if self.names.attr_type == 'get' else '(%s)' % self.fn_args
      func_str = '\n\t%s%s%s%s%s => ' % (maybe_comment, maybe_ret_type, dartify_func(self.names, Context.FN_NAME), maybe_arg_count, maybe_params)
      func_call = '_delegate.%s%s(%s);' % (dartify_func(self.names, Context.CALL_NAME), maybe_arg_count, self.call_args)
      return func_str + func_call
  
  def setupArgs(self, sig):
    self.ctr_arg_types = list(map(lambda s: type_to_dec(self.interfaces, self.enums, s, False, Context.CTR_ARG), sig))
    self.ctr_args = ', '.join(['%s %s' % (self.ctr_arg_types[j], self.args[j]) for j in range(self.num_args)])
    self.fn_arg_types = list(map(lambda s: type_to_dec(self.interfaces, self.enums, s, False, Context.FN_ARG), sig))
    self.fn_args = ', '.join(['%s %s' % (self.fn_arg_types[j], self.args[j]) for j in range(self.num_args)])

  def setupCall(self, raw_sig):
    self.call_args = ', '.join(['%s' % (self.args[j]) for j in range(self.num_args)])

def dartify_func(names, context):
  if (names.dart_func_name == '__destroy__'): return 'dispose'
  prefix = ''
  text = names.dart_func_name
  if names.attr_type == 'set' and context == Context.FN_NAME:
    prefix = 'set '
    text = names.dart_func_name.replace('set_', '')
  elif names.attr_type == 'set_array' and context == Context.FN_NAME:
    text = names.dart_func_name.replace('set_', '')+'Insert'
  elif names.attr_type == 'get' and context == Context.FN_NAME:
    prefix = 'get '
    text = names.dart_func_name.replace('get_', '')
  elif names.attr_type == 'get_array' and context == Context.FN_NAME:
    text = names.dart_func_name.replace('get_', '')+'ElementAt'
  return prefix + lower_first(text)

def type_to_dec(interfaces, enums, t, non_pointing=False, context=Context.DEFAULT):
  # print 'to dec ', t
  def base_type_to_dec(t):
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
      ret = 'String'
    elif t == 'Float':
      ret = 'double'
    elif t == 'Double':
      ret = 'double'
    elif t == 'Boolean':
      ret = 'bool'
    elif t == 'Any' or t == 'VoidPtr':
      ret = 'void*'
    elif t in interfaces:
      ret = (interfaces[t].getExtendedAttribute('Prefix') or [''])[0] + t[0].upper() + t[1:]
      ret = '%sPlatform' % ret # add covariant to delegates.dart function args - to avoid type errors for args in ffi.dart
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
  return prefix + base_type_to_dec(t) + suffix
