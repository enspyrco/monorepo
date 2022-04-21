from enum import Enum
class Context(Enum):
  DEFAULT = 0
  JSI_RET = 1
  JSI_ARG = 2
  JSA_RET = 3
  JSA_ARG = 4

class JSIO:
  def __init__(self, return_type, interfaces, args, sig, i):
    self.arg_types_jsi = list(map(lambda s: type_to_jsio(interfaces, s, False, Context.JSI_ARG), sig))
    self.joined_arg_types_jsi = ', '.join(['%s' % (self.arg_types_jsi[j]) for j in range(i)])
    self.arg_types_jsa = list(map(lambda s: type_to_jsio(interfaces, s, False, Context.JSA_ARG), sig))
    self.joined_arg_types_jsa = ', '.join(['%s' % (self.arg_types_jsa[j]) for j in range(i)])
    self.jsa_in_arg_types = list(map(lambda s: type_to_jsio(interfaces, s, False, Context.JSA_ARG), sig))
    self.jsa_in_args = ', '.join(['%s %s' % (self.jsa_in_arg_types[j], args[j]) for j in range(i)])
    self.jsi_in_arg_types = list(map(lambda s: type_to_jsio(interfaces, s, False, Context.JSI_ARG), sig))
    self.jsi_in_args = ', '.join(['%s %s' % (self.jsi_in_arg_types[j], args[j]) for j in range(i)])
    self.return_type_jsi = type_to_jsio(interfaces, return_type, False, Context.JSI_RET)
    self.return_type_jsa = type_to_jsio(interfaces, return_type, False, Context.JSA_RET)

def type_to_jsio(interfaces, t, non_pointing=False, context=Context.DEFAULT):
  # print 'to jsio', t
  def base_type_to_jsio(t):
    if t == 'Long':
      if(context==Context.JSI_RET or context==Context.JSI_ARG):
        ret = 'num'
      else:
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
      if(context==Context.JSI_ARG):
        ret = 'num'
      elif(context==Context.JSI_RET):
        ret = 'double'
      else:
        ret = 'double'
    elif t == 'Double':
      if(context==Context.JSI_ARG):
        ret = 'num'
      elif(context==Context.JSI_RET):
        ret = 'double'
      else:
        ret = 'double'
    elif t == 'Boolean':
        ret = 'bool'
    elif t == 'Any' or t == 'VoidPtr':
      ret = 'void*'
    elif t in interfaces:
      ret = (interfaces[t].getExtendedAttribute('Prefix') or [''])[0] + t[0].upper() + t[1:] 
      if(context == Context.JSA_RET or context == Context.JSA_ARG): ret += 'JSAdapter'
      elif(context == Context.JSI_RET or context == Context.JSI_ARG): ret += 'JSImpl'
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
  return prefix + base_type_to_jsio(t) + suffix
