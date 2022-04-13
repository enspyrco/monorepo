import emscripten.WebIDL as WebIDL

# CHECKS='FAST' will skip most argument type checks in the wrapper methods for
#                  performance (~3x faster than default).
# CHECKS='ALL' will do extensive argument type checking (~5x slower than default).
#                 This will catch invalid numbers, invalid pointers, invalid strings, etc.
# Anything else defaults to legacy mode for backward compatibility.
CHECKS='FAST'
# DEBUG=1 will print debug info in render_function
DEBUG=0

class Dummy:
  def __init__(self, init):
    for k, v in init.items():
      self.__dict__[k] = v

  def getExtendedAttribute(self, name): # noqa: U100
    return None

def full_typename(arg):
  return ('const ' if arg.getExtendedAttribute('Const') else '') + arg.type.name + ('[]' if arg.type.isArray() else '')


def take_addr_if_nonpointer(m):
  if m.getExtendedAttribute('Ref') or m.getExtendedAttribute('Value'):
    return '&'
  return ''

def deref_if_nonpointer(m):
  if m.getExtendedAttribute('Ref') or m.getExtendedAttribute('Value'):
    return '*'
  return ''

def type_to_cdec(interfaces, raw):
  ret = type_to_c(interfaces, raw.type.name, non_pointing=True)
  if raw.getExtendedAttribute('Const'):
    ret = 'const ' + ret
  if raw.type.name not in interfaces:
    return ret
  if raw.getExtendedAttribute('Ref'):
    return ret + '&'
  if raw.getExtendedAttribute('Value'):
    return ret
  return ret + '*'



def render_function(interfaces, mid_c, class_name, func_name, sigs, return_type, non_pointer,
                    copy, operator, constructor, func_scope,
                    call_content=None, const=False, array_attribute=False):
  legacy_mode = CHECKS not in ['ALL', 'FAST']
  all_checks = CHECKS == 'ALL'

  bindings_name = class_name + '_' + func_name
  min_args = min(sigs.keys())
  max_args = max(sigs.keys())

  all_args = sigs.get(max_args)

  if DEBUG:
    print('renderfunc', class_name, func_name, list(sigs.keys()), return_type, constructor)
    for i in range(max_args):
      a = all_args[i]
      if isinstance(a, WebIDL.IDLArgument):
        print(' ', a.identifier.name, a.identifier, a.type, a.optional)
      else:
        print("  arg%d" % i)

  # JS

  cache = ('getCache(%s)[this.ptr] = this;' % class_name) if constructor else ''
  call_prefix = '' if not constructor else 'this.ptr = '
  call_postfix = ''
  if return_type != 'Void' and not constructor:
    call_prefix = 'return '
  if not constructor:
    if return_type in interfaces:
      call_prefix += 'wrapPointer('
      call_postfix += ', ' + return_type + ')'
    elif return_type == 'String':
      call_prefix += 'UTF8ToString('
      call_postfix += ')'
    elif return_type == 'Boolean':
      call_prefix += '!!('
      call_postfix += ')'

  args = [(all_args[i].identifier.name if isinstance(all_args[i], WebIDL.IDLArgument) else ('arg%d' % i)) for i in range(max_args)]
  if not constructor:
    body = '  var self = this.ptr;\n'
    pre_arg = ['self']
  else:
    body = ''
    pre_arg = []

  if any(arg.type.isString() or arg.type.isArray() for arg in all_args):
    body += '  ensureCache.prepare();\n'

  full_name = "%s::%s" % (class_name, func_name)

  for i, (js_arg, arg) in enumerate(zip(args, all_args)):
    if i >= min_args:
      optional = True
    else:
      optional = False
    do_default = False
    # Filter out arguments we don't know how to parse. Fast casing only common cases.
    compatible_arg = isinstance(arg, Dummy) or (isinstance(arg, WebIDL.IDLArgument) and arg.optional is False)
    # note: null has typeof object, but is ok to leave as is, since we are calling into asm code where null|0 = 0
    if not legacy_mode and compatible_arg:
      if isinstance(arg, WebIDL.IDLArgument):
        arg_name = arg.identifier.name
      else:
        arg_name = ''
      # Format assert fail message
      check_msg = "[CHECK FAILED] %s(%s:%s): " % (full_name, js_arg, arg_name)
      if isinstance(arg.type, WebIDL.IDLWrapperType):
        inner = arg.type.inner
      else:
        inner = ""

      # Print type info in comments.
      body += "  /* %s <%s> [%s] */\n" % (js_arg, arg.type.name, inner)

      # Wrap asserts with existence check when argument is optional.
      if all_checks and optional:
        body += "if(typeof {0} !== 'undefined' && {0} !== null) {{\n".format(js_arg)
      # Special case argument types.
      if arg.type.isNumeric():
        if arg.type.isInteger():
          if all_checks:
            body += "  assert(typeof {0} === 'number' && !isNaN({0}), '{1}Expecting <integer>');\n".format(js_arg, check_msg)
        else:
          if all_checks:
            body += "  assert(typeof {0} === 'number', '{1}Expecting <number>');\n".format(js_arg, check_msg)
        # No transform needed for numbers
      elif arg.type.isBoolean():
        if all_checks:
          body += "  assert(typeof {0} === 'boolean' || (typeof {0} === 'number' && !isNaN({0})), '{1}Expecting <boolean>');\n".format(js_arg, check_msg)
        # No transform needed for booleans
      elif arg.type.isString():
        # Strings can be DOM strings or pointers.
        if all_checks:
          body += "  assert(typeof {0} === 'string' || ({0} && typeof {0} === 'object' && typeof {0}.ptr === 'number'), '{1}Expecting <string>');\n".format(js_arg, check_msg)
        do_default = True # legacy path is fast enough for strings.
      elif arg.type.isInterface():
        if all_checks:
          body += "  assert(typeof {0} === 'object' && typeof {0}.ptr === 'number', '{1}Expecting <pointer>');\n".format(js_arg, check_msg)
        if optional:
          body += "  if(typeof {0} !== 'undefined' && {0} !== null) {{ {0} = {0}.ptr }};\n".format(js_arg)
        else:
          # No checks in fast mode when the arg is required
          body += "  {0} = {0}.ptr;\n".format(js_arg)
      else:
        do_default = True

      if all_checks and optional:
        body += "}\n"
    else:
      do_default = True

    if do_default:
      if not (arg.type.isArray() and not array_attribute):
        body += "  if ({0} && typeof {0} === 'object') {0} = {0}.ptr;\n".format(js_arg)
        if arg.type.isString():
          body += "  else {0} = ensureString({0});\n".format(js_arg)
      else:
        # an array can be received here
        arg_type = arg.type.name
        if arg_type in ['Byte', 'Octet']:
          body += "  if (typeof {0} == 'object') {{ {0} = ensureInt8({0}); }}\n".format(js_arg)
        elif arg_type in ['Short', 'UnsignedShort']:
          body += "  if (typeof {0} == 'object') {{ {0} = ensureInt16({0}); }}\n".format(js_arg)
        elif arg_type in ['Long', 'UnsignedLong']:
          body += "  if (typeof {0} == 'object') {{ {0} = ensureInt32({0}); }}\n".format(js_arg)
        elif arg_type == 'Float':
          body += "  if (typeof {0} == 'object') {{ {0} = ensureFloat32({0}); }}\n".format(js_arg)
        elif arg_type == 'Double':
          body += "  if (typeof {0} == 'object') {{ {0} = ensureFloat64({0}); }}\n".format(js_arg)

  c_names = {}
  for i in range(min_args, max_args):
    c_names[i] = 'emscripten_bind_%s_%d' % (bindings_name, i)
    body += '  if (%s === undefined) { %s%s(%s)%s%s }\n' % (args[i], call_prefix, '_' + c_names[i], ', '.join(pre_arg + args[:i]), call_postfix, '' if 'return ' in call_prefix else '; ' + (cache or ' ') + 'return')
  c_names[max_args] = 'emscripten_bind_%s_%d' % (bindings_name, max_args)
  body += '  %s%s(%s)%s;\n' % (call_prefix, '_' + c_names[max_args], ', '.join(pre_arg + args), call_postfix)
  if cache:
    body += '  ' + cache + '\n'

  # C

  for i in range(min_args, max_args + 1):
    raw = sigs.get(i)
    if raw is None:
      continue
    sig = list(map(full_typename, raw))
    if array_attribute:
      sig = [x.replace('[]', '') for x in sig] # for arrays, ignore that this is an array - our get/set methods operate on the elements

    c_arg_types = list(map(type_to_c, interfaces, sig))

    normal_args = ', '.join(['%s %s' % (c_arg_types[j], args[j]) for j in range(i)])
    if constructor:
      full_args = normal_args
    else:
      full_args = type_to_c(interfaces, class_name, non_pointing=True) + '* self' + ('' if not normal_args else ', ' + normal_args)
    call_args = ', '.join(['%s%s' % ('*' if raw[j].getExtendedAttribute('Ref') else '', args[j]) for j in range(i)])
    if constructor:
      call = 'new ' + type_to_c(interfaces, class_name, non_pointing=True)
      call += '(' + call_args + ')'
    elif call_content is not None:
      call = call_content
    else:
      call = 'self->' + func_name
      call += '(' + call_args + ')'

    if operator:
      cast_self = 'self'
      if class_name != func_scope:
        # this function comes from an ancestor class; for operators, we must cast it
        cast_self = 'dynamic_cast<' + type_to_c(interfaces, func_scope) + '>(' + cast_self + ')'
      maybe_deref = deref_if_nonpointer(raw[0])
      if '=' in operator:
        call = '(*%s %s %s%s)' % (cast_self, operator, maybe_deref, args[0])
      elif operator == '[]':
        call = '((*%s)[%s%s])' % (cast_self, maybe_deref, args[0])
      else:
        raise Exception('unfamiliar operator ' + operator)

    pre = ''

    basic_return = 'return ' if constructor or return_type != 'Void' else ''
    return_prefix = basic_return
    return_postfix = ''
    if non_pointer:
      return_prefix += '&'
    if copy:
      pre += '  static %s temp;\n' % type_to_c(interfaces, return_type, non_pointing=True)
      return_prefix += '(temp = '
      return_postfix += ', &temp)'

    c_return_type = type_to_c(interfaces, return_type)
    maybe_const = 'const ' if const else ''
    mid_c.append(r'''
%s%s EMSCRIPTEN_KEEPALIVE %s(%s) {
%s  %s%s%s;
}
''' % (maybe_const, type_to_c(interfaces, class_name) if constructor else c_return_type, c_names[i], full_args, pre, return_prefix, call, return_postfix))

    if not constructor:
      if i == max_args:
        dec_args = ', '.join([type_to_cdec(interfaces, raw[j]) + ' ' + args[j] for j in range(i)])
        js_call_args = ', '.join(['%s%s' % (('(ptrdiff_t)' if sig[j] in interfaces else '') + take_addr_if_nonpointer(raw[j]), args[j]) for j in range(i)])


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