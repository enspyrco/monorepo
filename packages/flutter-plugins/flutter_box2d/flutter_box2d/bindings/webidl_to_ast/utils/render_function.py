import emscripten.WebIDL as WebIDL
from utils.utils import dartify_call, lower_first, upper_first, type_to_c, type_to_cdec, full_typename, deref_if_nonpointer, take_addr_if_nonpointer
from utils.utils_dart import Context, type_to_dart
from utils.utils_ffi import FFI
from utils.utils_jsio import JSIO

CHECKS='FAST'
DEBUG=0

def render_function(interfaces, output, class_name, func_name, sigs, return_type, non_pointer,
                    copy, operator, constructor, func_scope,
                    call_content=None, const=False, array_attribute=False):
  bindings_name = class_name + '_' + func_name
  dart_class_name = upper_first(class_name)
  del_class_name = dart_class_name + 'Platform'
  dart_func_name = lower_first(func_name)

  min_args = min(sigs.keys())
  max_args = max(sigs.keys())
  all_args = sigs.get(max_args)
  args = [(all_args[i].identifier.name if isinstance(all_args[i], WebIDL.IDLArgument) else ('arg%d' % i)) for i in range(max_args)]

  # ---- removed JS -----
  # C

  # these values are defined in the JS block above, fudged here as not sure what they should be at this point
  call_prefix = 'return '
  body = ''
  pre_arg = []
  call_postfix = ''
  cache = ('getCache(%s)[this.ptr] = this;' % class_name) if constructor else ''

  c_names = {}
  dart_itf_names = {}
  for i in range(min_args, max_args):
    c_names[i] = 'dart_bind_%s_%d' % (bindings_name, i)
    dart_itf_names[i] = '%s_%d' % (func_name, i)
    body += '  if (%s === undefined) { %s%s(%s)%s%s }\n' % (args[i], call_prefix, '_' + c_names[i], ', '.join(pre_arg + args[:i]), call_postfix, '' if 'return ' in call_prefix else '; ' + (cache or ' ') + 'return')
  c_names[max_args] = 'dart_bind_%s_%d' % (bindings_name, max_args)
  dart_itf_names[max_args] = '%s_%d' % (func_name, max_args)
  body += '  %s%s(%s)%s;\n' % (call_prefix, '_' + c_names[max_args], ', '.join(pre_arg + args), call_postfix)
  if cache:
    body += '  ' + cache + '\n'

  for i in range(min_args, max_args + 1):
    raw = sigs.get(i)
    if raw is None:
      continue
    sig = list(map(full_typename, raw))
    if array_attribute:
      sig = [x.replace('[]', '') for x in sig] # for arrays, ignore that this is an array - our get/set methods operate on the elements

    c_arg_types = list(map(type_to_c, interfaces, sig))
    dart_arg_types = list(map(lambda s: type_to_dart(interfaces, s, False, Context.DEL_ARG), sig))
    ffi = FFI(return_type, interfaces, sig, i)
    jsio = JSIO(return_type, interfaces, args, sig, i)

    normal_args = ', '.join(['%s %s' % (c_arg_types[j], args[j]) for j in range(i)])
    dart_args = ', '.join(['%s %s' % (dart_arg_types[j], args[j]) for j in range(i)])

    ffi_in_arg_types = list(map(lambda s: type_to_dart(interfaces, s, False, Context.FFI), sig))
    ffi_in_args = ', '.join(['%s %s' % (ffi_in_arg_types[j], args[j]) for j in range(i)])

    if constructor:
      full_args = normal_args
    else:
      full_args = type_to_c(interfaces, class_name, non_pointing=True) + '* self' + ('' if not normal_args else ', ' + normal_args)
    call_args = ', '.join(['%s%s' % ('*' if raw[j].getExtendedAttribute('Ref') else '', args[j]) for j in range(i)])
    call_args_ffi = ', '.join(['%s%s' % (args[j], '._self' if raw[j].getExtendedAttribute('Ref') else '') for j in range(i)])
    call_args_jsio = ', '.join(['%s%s' % (args[j], '._impl' if raw[j].getExtendedAttribute('Ref') else '') for j in range(i)])

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
    dart_return_type = type_to_dart(interfaces, return_type, False, Context.DEL_RET)
    maybe_const = 'const ' if const else ''
    output.mid_c.append(r'''
%s%s %s(%s) {
%s  %s%s%s;
}
''' % (maybe_const, type_to_c(interfaces, class_name) if constructor else c_return_type, c_names[i], full_args, pre, return_prefix, call, return_postfix))

    if(constructor):
      # PlatformInterface only uses constructors
      output.mid_dart_itf.append(r'''
  %s%s %s(%s) {
    throw UnimplementedError('%s(%s) has not been implemented.');
  }
''' % (maybe_const, type_to_dart(interfaces, class_name, False, Context.ITF), dart_itf_names[i], dart_args, dart_itf_names[i], full_args))
      
      maybe_from = ('.from%s' % i) if i != 0 else ''
      # Decorators
      output.mid_dart_decs.append('\n\t%s%s(%s) : _delegate = FlutterBox2DPlatform.instance.%s_%s(%s);\n' % (dart_class_name, maybe_from, dart_args, class_name, i, call_args))
      
      # Delegates constructors
      output.mid_dart_dels.append('\n\t%s%s(%s) : super(token: _token);\n' % (del_class_name, maybe_from, call_args))

      # FFI constructors - create lookup
      ctr_type_native = 'Pointer<Void> Function(%s)' % ffi.joined_arg_types_native
      ctr_type_dart = 'Pointer<Void> Function(%s)' % ffi.joined_arg_types_dart
      output.mid_dart_ffi.append('\n\tstatic final _ctr%s = _symbols.lookup<NativeFunction<%s>>(\'%s\').asFunction<%s>();\n' % (i, ctr_type_native, c_names[i], ctr_type_dart))
      # FFI constructors - use lookup
      output.mid_dart_ffi.append('\n\t%s%s(%s) : _self = _ctr%s(%s);\n' % (dart_class_name+'FfiAdapter', maybe_from, dart_args, i, call_args))
      # JS constructors
      output.mid_dart_jsadapter.append('\n\t%s%s(%s) : _impl = %s%s(%s);\n' % (dart_class_name+'JSAdapter', maybe_from, dart_args, dart_class_name+'JSImpl', maybe_from, call_args))
      output.mid_dart_jsimpl.append('\texternal %s%s(%s);\n' % (dart_class_name+'JSImpl', maybe_from, dart_args))


    else:
      # Delegates functions
      output.mid_dart_dels.append('\n\t%s %s(%s);\n' % (type_to_dart(interfaces, dart_return_type), dartify_call(dart_func_name), dart_args))
      # FFI functions - create lookup
      maybe_comma = ', ' if i > 0 else ''
      func_sig_native = '%s Function(Pointer<Void>%s%s)' % (ffi.return_type_native, maybe_comma, ffi.joined_arg_types_native)
      func_sig_dart = '%s Function(Pointer<Void>%s%s)' % (ffi.return_type_dart, maybe_comma, ffi.joined_arg_types_dart)
      output.mid_dart_ffi.append('\n\tstatic final _%s = _symbols.lookup<NativeFunction<%s>>(\'%s\').asFunction<%s>();\n' % (dart_func_name, func_sig_native, c_names[i], func_sig_dart))
      # FFI functions - use lookup
      func_str = '\n\t@override\n\t%s %s(%s) => ' % (ffi.return_type, dartify_call(dart_func_name), ffi_in_args)
      # If the function returns an object of the same type as the class we assume it is returning a Pointer<Void> and we wrap it (This is quite hacky but seeing if we can get away with it)
      if ffi.return_type == dart_class_name+'FfiAdapter':
        func_str += '%sFfiAdapter._(_%s(_self%s%s));\n' % (dart_class_name, dart_func_name, maybe_comma, call_args_ffi)
      else:
        func_str += '_%s(_self%s%s);\n' % (dart_func_name, maybe_comma, call_args_ffi)
      output.mid_dart_ffi.append(func_str)
      # JS functions - adapter
      maybe_convert = '.toDouble()' if return_type == 'Float' else ''
      func_str = ''
      if jsio.return_type_jsa == dart_class_name+'JSAdapter':
        func_str += '%sJSAdapter._(_impl.%s(%s)%s);\n' % (dart_class_name, dart_func_name, call_args_jsio, maybe_convert)
      else:
        func_str += '_impl.%s(%s)%s;\n' % (dart_func_name, call_args_jsio, maybe_convert)
      output.mid_dart_jsadapter.append('\n\t%s %s(%s) => %s' % (jsio.return_type_jsa, dartify_call(dart_func_name), jsio.jsa_in_args, func_str))
      # JS functions - impl
      output.mid_dart_jsimpl.append('\n\texternal %s %s(%s);\n' % (jsio.return_type_jsi, dart_func_name, jsio.jsi_in_args))

    if not constructor:
      if i == max_args:
        dec_args = ', '.join([type_to_cdec(interfaces, raw[j]) + ' ' + args[j] for j in range(i)])
        js_call_args = ', '.join(['%s%s' % (('(ptrdiff_t)' if sig[j] in interfaces else '') + take_addr_if_nonpointer(raw[j]), args[j]) for j in range(i)])
