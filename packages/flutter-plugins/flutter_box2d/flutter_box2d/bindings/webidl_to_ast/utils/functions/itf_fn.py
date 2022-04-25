class ItfFunction:
  def __init__(self, interfaces, args, i, const, constructor, names):
    self.interfaces = interfaces
    self.args = args
    self.arg_num = i
    self.const = const
    self.constructor = constructor
    self.names = names
  
  def render(self, sig, min_args, max_args, raw_sig):
    self.setupArgs(sig)
    self.setupBody(min_args, max_args)
    self.setupCall(raw_sig)
  
  def itf(self):
    maybe_const = 'const ' if self.const else ''
    line1 = '\t@override\n'
    line1 = '\t%s%s %s(%s) {' % (maybe_const, type_to_itf(self.interfaces, self.names.class_name, False)+'Platform', self.itf_names[self.arg_num], self.itf_args)
    line2 = '\t\tthrow UnimplementedError(\'%s(%s) has not been implemented.\');' % (self.itf_names[self.arg_num], self.full_args)
    line3 = '\t}'
    return '\n'+line1+'\n'+line2+'\n'+line3+'\n'
  
  def mac(self):
    maybe_const = 'const ' if self.const else ''
    maybe_from = ('.from%s' % self.arg_num) if self.arg_num != 0 else ''
    line1 = '\t%s%s %s(%s) => %s%s(%s);' % (maybe_const, type_to_itf(self.interfaces, self.names.class_name, False)+'Platform', self.itf_names[self.arg_num], self.itf_args, type_to_itf(self.interfaces, self.names.class_name, False)+'FfiAdapter', maybe_from, self.call_args)
    return '\n'+line1+'\n'

  def web(self):
    maybe_const = 'const ' if self.const else ''
    maybe_from = ('.from%s' % self.arg_num) if self.arg_num != 0 else ''
    line1 = '\t%s%s %s(%s) => %s%s(%s);' % (maybe_const, type_to_itf(self.interfaces, self.names.class_name, False)+'Platform', self.itf_names[self.arg_num], self.itf_args, type_to_itf(self.interfaces, self.names.class_name, False)+'JSAdapter', maybe_from, self.call_args)
    return '\n'+line1+'\n'
  
  def setupArgs(self, sig):
    itf_arg_types = list(map(lambda s: type_to_itf(self.interfaces, s, False), sig))
    self.itf_args = ', '.join(['%s %s' % (itf_arg_types[j], self.args[j]) for j in range(self.arg_num)])
    if self.constructor:
      self.full_args = self.itf_args
    else:
      self.full_args = type_to_itf(self.interfaces, self.names.class_name, non_pointing=True) + '* self' + ('' if not self.itf_args else ', ' + self.itf_args)

  def setupBody(self, min_args, max_args):
    self.itf_names = {}
    for i in range(min_args, max_args):
      self.itf_names[i] = '%s_%d' % (self.names.func_name, i)
    self.itf_names[max_args] = '%s_%d' % (self.names.func_name, max_args)
  
  def setupCall(self, raw_sig):
    self.call_args = ', '.join(['%s%s' % (self.args[j], '._self' if raw_sig[j].getExtendedAttribute('Ref') else '') for j in range(self.arg_num)])

def type_to_itf(interfaces, t, non_pointing=False):
  # print 'to itf ', t
  def base_type_to_itf(t):
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
  return prefix + base_type_to_itf(t) + suffix
