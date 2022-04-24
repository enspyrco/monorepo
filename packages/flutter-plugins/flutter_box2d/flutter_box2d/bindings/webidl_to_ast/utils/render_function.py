import emscripten.WebIDL as WebIDL
from utils.functions.itf_fn import ItfFunction
from utils.utils import dartify_call, type_to_cdec, full_typename, take_addr_if_nonpointer
from utils.utils_dart import Context, type_to_dart
from utils.utils_ffi import FFI
from utils.utils_jsio import JSIO
from utils.functions.c_fn import CFunction

CHECKS='FAST'
DEBUG=0

def render_function(interfaces, class_set, names, sigs, return_type, non_pointer,
                    copy, operator, constructor, func_scope,
                    call_content=None, const=False, array_attribute=False):

  min_args = min(sigs.keys())
  max_args = max(sigs.keys())
  all_args = sigs.get(max_args)
  args = [(all_args[i].identifier.name if isinstance(all_args[i], WebIDL.IDLArgument) else ('arg%d' % i)) for i in range(max_args)]

  for i in range(min_args, max_args + 1):
    raw_sig = sigs.get(i)
    if raw_sig is None:
      continue
    sig = list(map(full_typename, raw_sig))
    if array_attribute:
      sig = [x.replace('[]', '') for x in sig] # for arrays, ignore that this is an array - our get/set methods operate on the elements


    dart_arg_types = list(map(lambda s: type_to_dart(interfaces, s, False, Context.DEL_ARG), sig))
    dart_args = ', '.join(['%s %s' % (dart_arg_types[j], args[j]) for j in range(i)])

    ffi_in_arg_types = list(map(lambda s: type_to_dart(interfaces, s, False, Context.FFI), sig))
    ffi_in_args = ', '.join(['%s %s' % (ffi_in_arg_types[j], args[j]) for j in range(i)])

    call_args_ffi = ', '.join(['%s%s' % (args[j], '._self' if raw_sig[j].getExtendedAttribute('Ref') else '') for j in range(i)])
    call_args_jsio = ', '.join(['%s%s' % (args[j], '._impl' if raw_sig[j].getExtendedAttribute('Ref') else '') for j in range(i)])
    
    dart_return_type = type_to_dart(interfaces, return_type, False, Context.DEL_RET)
    

    ffi = FFI(return_type, interfaces, sig, i)
    jsio = JSIO(return_type, interfaces, args, sig, i)

    

    c_fn = CFunction(interfaces, args, i, const, constructor, operator, names, return_type)
    c_fn.setupArgs(sig)
    c_fn.setupBody(min_args, max_args)
    c_fn.setupReturn(non_pointer, copy)
    c_fn.setupCall(call_content, func_scope, raw_sig)
    class_set.c.append(c_fn.render())


#     maybe_const = 'const ' if const else ''
# maybe_from = ('.from%s' % i) if i != 0 else ''

    if(constructor):
      
      itf_fn = ItfFunction(interfaces, args, i, const, constructor, names)
      itf_fn.setupArgs(sig)
      itf_fn.setupBody(min_args, max_args)
      class_set.itf.append(itf_fn.render())
      
      # # Decorators
      # class_set.decs.append('\n\t%s%s(%s) : _delegate = FlutterBox2DPlatform.instance.%s_%s(%s);\n' % (names.dart_class_name, maybe_from, dart_args, names.class_name, i, call_args))
      
    #   # Delegates constructors
    #   class_set.dels.append('\n\t%s%s(%s) : super(token: _token);\n' % (names.del_class_name, maybe_from, call_args))

    #   # FFI constructors - create lookup
    #   ctr_type_native = 'Pointer<Void> Function(%s)' % ffi.joined_arg_types_native
    #   ctr_type_dart = 'Pointer<Void> Function(%s)' % ffi.joined_arg_types_dart
    #   class_set.ffi.append('\n\tstatic final _ctr%s = _symbols.lookup<NativeFunction<%s>>(\'%s\').asFunction<%s>();\n' % (i, ctr_type_native, c_names[i], ctr_type_dart))
    #   # FFI constructors - use lookup
    #   class_set.ffi.append('\n\t%s%s(%s) : _self = _ctr%s(%s);\n' % (names.dart_class_name+'FfiAdapter', maybe_from, dart_args, i, call_args))
    #   # JS constructors
    #   class_set.jsadapter.append('\n\t%s%s(%s) : _impl = %s%s(%s);\n' % (names.dart_class_name+'JSAdapter', maybe_from, dart_args, names.dart_class_name+'JSImpl', maybe_from, call_args))
    #   class_set.jsimpl.append('\texternal %s%s(%s);\n' % (names.dart_class_name+'JSImpl', maybe_from, dart_args))


#     else:
#       # Delegates functions
#       class_set.dels.append('\n\t%s %s(%s);\n' % (type_to_dart(interfaces, dart_return_type), dartify_call(names.dart_func_name), dart_args))
#       # FFI functions - create lookup
#       maybe_comma = ', ' if i > 0 else ''
#       func_sig_native = '%s Function(Pointer<Void>%s%s)' % (ffi.return_type_native, maybe_comma, ffi.joined_arg_types_native)
#       func_sig_dart = '%s Function(Pointer<Void>%s%s)' % (ffi.return_type_dart, maybe_comma, ffi.joined_arg_types_dart)
#       class_set.ffi.append('\n\tstatic final _%s = _symbols.lookup<NativeFunction<%s>>(\'%s\').asFunction<%s>();\n' % (names.dart_func_name, func_sig_native, c_names[i], func_sig_dart))
#       # FFI functions - use lookup
#       func_str = '\n\t@override\n\t%s %s(%s) => ' % (ffi.return_type, dartify_call(names.dart_func_name), ffi_in_args)
#       # If the function returns an object of the same type as the class we assume it is returning a Pointer<Void> and we wrap it (This is quite hacky but seeing if we can get away with it)
#       if ffi.return_type == names.dart_class_name+'FfiAdapter':
#         func_str += '%sFfiAdapter._(_%s(_self%s%s));\n' % (names.dart_class_name, names.dart_func_name, maybe_comma, call_args_ffi)
#       else:
#         func_str += '_%s(_self%s%s);\n' % (names.dart_func_name, maybe_comma, call_args_ffi)
#       class_set.ffi.append(func_str)
#       # JS functions - adapter
#       maybe_convert = '.toDouble()' if return_type == 'Float' else ''
#       func_str = ''
#       if jsio.return_type_jsa == names.dart_class_name+'JSAdapter':
#         func_str += '%sJSAdapter._(_impl.%s(%s)%s);\n' % (names.dart_class_name, names.dart_func_name, call_args_jsio, maybe_convert)
#       else:
#         func_str += '_impl.%s(%s)%s;\n' % (names.dart_func_name, call_args_jsio, maybe_convert)
#       class_set.jsadapter.append('\n\t%s %s(%s) => %s' % (jsio.return_type_jsa, dartify_call(names.dart_func_name), jsio.jsa_in_args, func_str))
#       # JS functions - impl
#       class_set.jsimpl.append('\n\texternal %s %s(%s);\n' % (jsio.return_type_jsi, names.dart_func_name, jsio.jsi_in_args))

#     if not constructor:
#       if i == max_args:
#         dec_args = ', '.join([type_to_cdec(interfaces, raw[j]) + ' ' + args[j] for j in range(i)])
#         js_call_args = ', '.join(['%s%s' % (('(ptrdiff_t)' if sig[j] in interfaces else '') + take_addr_if_nonpointer(raw[j]), args[j]) for j in range(i)])
