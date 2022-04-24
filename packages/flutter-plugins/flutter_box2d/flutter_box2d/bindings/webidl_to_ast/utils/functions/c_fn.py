from utils.utils import deref_if_nonpointer

class CFunction:
  def __init__(self, interfaces, args, i, const, constructor, operator, names, return_type):
    self.interfaces = interfaces
    self.args = args
    self.arg_num = i
    self.constructor = constructor
    self.operator = operator
    self.names = names
    self.return_type = return_type
    self.maybe_const = 'const ' if const else ''
    self.c_return_type = type_to_c(interfaces, return_type)
  
  def setupArgs(self, sig):
    c_arg_types = list(map(type_to_c, self.interfaces, sig))
    normal_args = ', '.join(['%s %s' % (c_arg_types[j], self.args[j]) for j in range(self.arg_num)])
    if self.constructor:
      self.full_args = normal_args
    else:
      self.full_args = type_to_c(self.interfaces, self.names.class_name, non_pointing=True) + '* self' + ('' if not normal_args else ', ' + normal_args)
    

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
    
  def setupReturn(self, non_pointer, copy):
    self.pre = ''
    basic_return = 'return ' if self.constructor or self.return_type != 'Void' else ''
    self.return_prefix = basic_return
    self.return_postfix = ''
    if non_pointer:
      self.return_prefix += '&'
    if copy:
      self.pre += '  static %s temp;\n' % type_to_c(self.interfaces, self.return_type, non_pointing=True)
      self.return_prefix += '(temp = '
      self.return_postfix += ', &temp)'

  def setupCall(self, call_content, func_scope, raw_sig):
    call_args = ', '.join(['%s%s' % ('*' if raw_sig[j].getExtendedAttribute('Ref') else '', self.args[j]) for j in range(self.arg_num)])

    if self.constructor:
      self.call = 'new ' + type_to_c(self.interfaces, self.names.class_name, non_pointing=True)
      self.call += '(' + call_args + ')'
    elif call_content is not None:
      self.call = call_content
    else:
      self.call = 'self->' + self.names.func_name
      self.call += '(' + call_args + ')'

    if self.operator:
      cast_self = 'self'
      if self.names.class_name != func_scope:
        # this function comes from an ancestor class; for operators, we must cast it
        cast_self = 'dynamic_cast<' + type_to_c(self.interfaces, func_scope) + '>(' + cast_self + ')'
      maybe_deref = deref_if_nonpointer(raw_sig[0])
      if '=' in self.operator:
        self.call = '(*%s %s %s%s)' % (cast_self, self.operator, maybe_deref, self.args[0])
      elif self.operator == '[]':
        self.call = '((*%s)[%s%s])' % (cast_self, maybe_deref, self.args[0])
      else:
        raise Exception('unfamiliar operator ' + self.operator)

  def render(self):
    line1 = '%s%s %s(%s) {' % (self.maybe_const, type_to_c(self.interfaces, self.names.class_name) if self.constructor else self.c_return_type, self.c_names[self.arg_num], self.full_args)
    line2 = '%s  %s%s%s;' % (self.pre, self.return_prefix, self.call, self.return_postfix)
    line3 = '}'
    return '\n'+line1+'\n'+line2+'\n'+line3+'\n'
  

def type_to_c(interfaces, t, non_pointing=False):
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
      ret = 'float'
    elif t == 'Double':
      ret = 'double'
    elif t == 'Boolean':
      ret = 'bool'
    elif t == 'Any' or t == 'VoidPtr':
      ret = 'void*'
    elif t in interfaces:
      ret = (interfaces[t].getExtendedAttribute('Prefix') or [''])[0] + t + ('' if non_pointing else '*')
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
    prefix = 'const '
  return prefix + base_type_to_c(t) + suffix