# Decorators
class DecFunction:
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
    maybe_from = ('.from%s' % self.arg_num) if self.arg_num != 0 else ''
    if(self.constructor):
      return '\n\t%s%s(%s) : _delegate = FlutterBox2DPlatform.instance.%s_%s(%s);\n' % (self.names.dart_class_name, maybe_from, self.dec_args, self.names.class_name, self.arg_num, self.call_args)
    else:
      return ''
  
  def setupArgs(self, sig):
    self.dec_arg_types = list(map(lambda s: type_to_dec(self.interfaces, s, False), sig))
    self.dec_args = ', '.join(['%s %s' % (self.dec_arg_types[j], self.args[j]) for j in range(self.arg_num)])
  
  def setupCall(self, raw_sig):
    self.call_args = ', '.join(['%s%s' % ('*' if raw_sig[j].getExtendedAttribute('Ref') else '', self.args[j]) for j in range(self.arg_num)])


def type_to_dec(interfaces, t, non_pointing=False):
  # print 'to dec ', t
  def base_type_to_dec(t):
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
      ret = 'covariant %sPlatform' % ret # add covariant to delegates.dart function args - to avoid type errors for args in ffi.dart
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
