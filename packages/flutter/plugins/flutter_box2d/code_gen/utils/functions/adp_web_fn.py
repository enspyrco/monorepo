from enum import Enum
from utils.utils import upper_first, lower_first, not_supported_yet

class Context(Enum):
  DEFAULT = 0
  JSI_RET = 1
  JSI_ARG = 2
  JSA_RET = 3
  JSA_ARG = 4

class WebFunction:
  def __init__(self, interfaces, enums, args, i, min_args, const, constructor, overload, names, return_type):
    self.interfaces = interfaces
    self.enums = enums
    self.args = args
    self.num_args = i
    self.min_args = min_args
    self.const = const
    self.constructor = constructor
    self.overload = overload
    self.names = names
    self.return_type = return_type
    self.jsimpl_intr = ''
    self.jsimpl_extn = ''

    if overload and not constructor: print('%s : %s%s' % (names.class_name, names.func_name, i))
  
  def render(self, sig, raw_sig):
    self.setupArgs(sig)
    self.setupCall(raw_sig)

    maybe_from = ('.from%s' % self.num_args) if self.num_args != 0 else ''
    maybe_arg_count = ('%s' % self.num_args) if self.overload else ''

    if(self.constructor):
      self.jsadapter = '\n\t%s%s(%s) : _impl = %s%s(%s);\n' % (self.names.dart_class_name+'JSAdapter', maybe_from, self.jsa_in_args, self.names.dart_class_name+'JSImpl', maybe_from, self.call_args)
      self.jsimpl_intr = '\t@JS(\'%s\')\n\texternal %s%s(%s);\n' % (self.names.func_name, self.names.dart_class_name+'JSImpl', maybe_from, self.jsi_in_args)
    else:
      maybe_convert = ''
      if (self.return_type == 'Float'): maybe_convert = '.toDouble()'
      if (self.return_type == 'Long'): maybe_convert = '.toInt()'
      
      func_str = ''
      if self.return_type in self.interfaces:
        wrapper = (self.interfaces[self.return_type].getExtendedAttribute('Prefix') or [''])[0] + upper_first(self.return_type)
        func_str += '%sJSAdapter._(_impl.%s(%s)%s);' % (wrapper, self.names.func_name, self.call_args, maybe_convert)
      else:
        func_str += '_impl.%s(%s)%s;' % (self.names.func_name, self.call_args, maybe_convert)
      
      maybe_comment = '//' if not_supported_yet(sig) else ''
      self.jsadapter = '\n\t%s%s %s%s(%s) => %s' % (maybe_comment, self.return_type_jsa, dartify_call(self.names.dart_func_name), maybe_arg_count, self.jsa_in_args, func_str)
      self.jsimpl_extn = '\n\t%sexternal %s %s(%s);' % (maybe_comment, self.return_type_jsi, self.names.func_name, self.jsi_in_args)
      self.jsimpl_extn = self.jsimpl_extn if (self.num_args == len(self.args)) else ''
  
  def adapter(self):
    return self.jsadapter
  
  def impl_intr(self):
    return self.jsimpl_intr
  
  def impl_extn(self):
    return self.jsimpl_extn
  
  def setupArgs(self, sig):
    self.arg_types_jsi = list(map(lambda s: type_to_web(self.interfaces, self.enums, s, False, Context.JSI_ARG), sig))
    self.joined_arg_types_jsi = ', '.join(['%s' % (self.arg_types_jsi[j]) for j in range(self.num_args)])
    self.arg_types_jsa = list(map(lambda s: type_to_web(self.interfaces, self.enums, s, False, Context.JSA_ARG), sig))
    self.joined_arg_types_jsa = ', '.join(['%s' % (self.arg_types_jsa[j]) for j in range(self.num_args)])
    self.jsa_in_arg_types = list(map(lambda s: type_to_web(self.interfaces, self.enums, s, False, Context.JSA_ARG), sig))
    self.jsa_in_args = ', '.join(['%s %s' % (self.jsa_in_arg_types[j], self.args[j]) for j in range(self.num_args)])
    self.jsi_in_arg_types = list(map(lambda s: type_to_web(self.interfaces, self.enums, s, False, Context.JSI_ARG), sig))
    self.jsi_in_args = ', '.join(['%s%s %s' % (self.jsi_in_arg_types[j], self.maybeNullable(j), self.args[j]) for j in range(self.num_args)])
    self.return_type_jsi = type_to_web(self.interfaces, self.enums, self.return_type, False, Context.JSI_RET)
    self.return_type_jsa = type_to_web(self.interfaces, self.enums, self.return_type, False, Context.JSA_RET)    
  
  # make latter args nullable in overloaded functions 
  def maybeNullable(self, x):
    return '?' if x >= self.min_args else ''

  def setupCall(self, raw_sig):
    if len(raw_sig) == 0: 
      self.call_args = ''
      return

    if(self.constructor):
      self.call_args = ', '.join(['%s%s' % (self.args[j], '._impl' if raw_sig[j].type.name in self.interfaces else '') for j in range(self.num_args)])
      return
    
    # we may want to check if the type is a reference type with "if raw_sig[j].getExtendedAttribute('Ref')"
    self.call_args = '%s%s' % (self.args[0], '._impl' if raw_sig[0].type.name in self.interfaces else '')
    for x in range(1, len(self.args)): # go through max_args so we can use single overloaded JS function and pass null for missing args 
      if(x >= self.num_args):
        self.call_args += ', null'
      else:
        self.call_args += ', ' + '%s%s' % (self.args[x], '._impl' if raw_sig[x].type.name in self.interfaces else '')

def dartify_call(text):
  if (text == '__destroy__'): return 'dispose'
  prefix = ''
  # if text.startswith('set_'):
  #   prefix = 'set '
  #   text = text.replace('set_', '')
  return prefix + lower_first(text)

def type_to_web(interfaces, enums, t, non_pointing=False, context=Context.DEFAULT):
  # print 'to web', t
  def base_type_to_web(t):
    if t == 'Long':
      if(context==Context.JSI_RET or context==Context.JSI_ARG):
        ret = 'num'
      else:
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
  return prefix + base_type_to_web(t) + suffix



