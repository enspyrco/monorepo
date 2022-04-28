import emscripten.WebIDL as WebIDL
from utils.utils import full_typename
from utils.functions.c_glue_fn import CFunction
from utils.functions.itf_fn import ItfFunction
from utils.functions.dec_fn import DecFunction
from utils.functions.del_fn import DelFunction
from utils.functions.adp_ffi_fn import FfiFunction
from utils.functions.adp_web_fn import WebFunction

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

    c_fn = CFunction(interfaces, args, i, const, constructor, operator, names, return_type)
    class_set.glue_c.append(c_fn.render(sig, min_args, max_args, non_pointer, copy, call_content, func_scope, raw_sig))

    if(constructor): # PlatformInterface only uses constructors
      itf_fn = ItfFunction(interfaces, args, i, const, constructor, names)
      itf_fn.render(sig, min_args, max_args, raw_sig)
      itf = itf_fn.itf()
      mac = itf_fn.mac()
      web = itf_fn.web()
      class_set.itf.append(itf)
      class_set.itf_mac.append(mac)
      class_set.itf_web.append(web)

    dec_fn = DecFunction(interfaces, args, i, const, constructor, names, return_type)
    class_set.decs.append(dec_fn.render(sig, raw_sig))

    del_fn = DelFunction(interfaces, args, i, const, constructor, names, return_type)
    class_set.dels.append(del_fn.render(sig, raw_sig))

    ffi_fn = FfiFunction(interfaces, args, i, const, constructor, names, return_type)
    class_set.ffi.append(ffi_fn.render(sig, min_args, max_args, raw_sig))

    web_fn = WebFunction(interfaces, args, i, const, constructor, names, return_type)
    web_fn.render(sig, raw_sig)
    class_set.jsadapter.append(web_fn.adapter())
    class_set.jsimpl.append(web_fn.impl())
