from enum import Enum
class Context(Enum):
  DEFAULT = 0
  NATIVE_RET = 1
  NATIVE_ARG = 2
  DART_RET = 3
  DART_ARG = 4

class FFI:
  def __init__(self, return_type, interfaces, sig, i):
    self.arg_types_native = list(map(lambda s: type_to_ffi(interfaces, s, False, Context.NATIVE_ARG), sig))
    self.joined_arg_types_native = ', '.join(['%s' % (self.arg_types_native[j]) for j in range(i)])
    self.arg_types_dart = list(map(lambda s: type_to_ffi(interfaces, s, False, Context.DART_ARG), sig))
    self.joined_arg_types_dart = ', '.join(['%s' % (self.arg_types_dart[j]) for j in range(i)])
    self.return_type_native = type_to_ffi(interfaces, return_type, False, Context.NATIVE_RET)
    self.return_type_dart = type_to_ffi(interfaces, return_type, False, Context.DART_RET)
    self.return_type = type_to_ffi(interfaces, return_type)

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
