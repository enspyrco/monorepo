from utils.utils import upper_first
from enum import Enum

class Context(Enum):
  DEFAULT = 0 # default context, ie no context has been supplied
  ITF = 1 # creating interface class
  DEL_RET = 2 # delegate return type
  DEL_ARG = 3 # delegate function arg types
  DECS = 4 # creating decorator classes
  FFI = 5 # creating Ffi classes

def type_to_dart(interfaces, t, non_pointing=False, context=Context.DEFAULT):
  # print 'to c ', t
  def base_type_to_c(t):
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
      ret = (interfaces[t].getExtendedAttribute('Prefix') or [''])[0] + t[0].upper() + t[1:] 
      if(context == Context.ITF): ret += 'Platform'
      elif(context == Context.DEL_RET): ret = '%sPlatform' % ret
      elif(context == Context.DEL_ARG): ret = 'covariant %sPlatform' % ret # add covariant to delegates.dart function args - to avoid type errors for args in ffi.dart
      elif(context == Context.FFI): ret += 'FfiAdapter'
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
  return prefix + base_type_to_c(t) + suffix
