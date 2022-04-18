import emscripten.WebIDL as WebIDL
from utils.utils import Output, Dummy, find_node_heights
from utils.render_function import render_function
from utils.utils_dart import pre_dart_itf, pre_dart_decs, pre_dart_dels

def read_file(file_path):
  """Read from a file opened in text mode"""
  with open(file_path) as fh:
    return fh.read()

p = WebIDL.Parser()
p.parse(r'''
interface VoidPtr {
};
''' + read_file('./Box2D.idl'))
data = p.finish()

interfaces = {}
implements = {}
enums = {}

for thing in data:
  if isinstance(thing, WebIDL.IDLInterface):
    interfaces[thing.identifier.name] = thing
  elif isinstance(thing, WebIDL.IDLImplementsStatement):
    implements.setdefault(thing.implementor.identifier.name, []).append(thing.implementee.identifier.name)
  elif isinstance(thing, WebIDL.IDLEnum):
    enums[thing.identifier.name] = thing

# interfaces

output = Output()

nodeHeights = find_node_heights(implements)
names = sorted(interfaces.keys(), key=lambda x: nodeHeights.get(x, 0), reverse=True)

for name in names:
  if name != 'b2Vec2':
    continue

  interface = interfaces[name]

  dart_name = name[0].upper() + name[1:]
  output.mid_c += ['\n// ' + name + '\n']
  output.mid_dart_decs += ['class ' + dart_name + ' {\n\n\tfinal ' + dart_name + 'Platform _delegate;\n']
  output.mid_dart_dels += ['\nabstract class ' + dart_name + 'Platform extends PlatformInterface {\n\n\tstatic final Object _token = Object();\n\tstatic ' + dart_name + 'Platform? _instance;\n']

  # Methods

  for m in interface.members:
    if not m.isMethod():
      continue
    constructor = m.identifier.name == name
    if not constructor:
      parent_constructor = False
      temp = m.parentScope
      while temp.parentScope:
        if temp.identifier.name == m.identifier.name:
          parent_constructor = True
        temp = temp.parentScope
      if parent_constructor:
        continue
    sigs = {}
    return_type = None
    for ret, args in m.signatures():
      if return_type is None:
        return_type = ret.name
      else:
        assert return_type == ret.name, 'overloads must have the same return type'
      for i in range(len(args) + 1):
        if i == len(args) or args[i].optional:
          assert i not in sigs, 'overloading must differentiate by # of arguments (cannot have two signatures that differ by types but not by length)'
          sigs[i] = args[:i]
    render_function(interfaces, output, name,
                    m.identifier.name, sigs, return_type,
                    m.getExtendedAttribute('Ref'),
                    m.getExtendedAttribute('Value'),
                    (m.getExtendedAttribute('Operator') or [None])[0],
                    constructor,
                    func_scope=m.parentScope.identifier.name,
                    const=m.getExtendedAttribute('Const'))

  for m in interface.members:
    if not m.isAttr():
      continue
    attr = m.identifier.name

    # Array is much easier for Dart? - just use List
    # Not sure what we need to do for bounds checks though, hopefully easy and the weirdness is 
    # exclusive to JS

    if m.type.isArray():
      get_sigs = {1: [Dummy({'type': WebIDL.BuiltinTypes[WebIDL.IDLBuiltinType.Types.long]})]}
      set_sigs = {2: [Dummy({'type': WebIDL.BuiltinTypes[WebIDL.IDLBuiltinType.Types.long]}),
                      Dummy({'type': m.type})]}
      get_call_content = '?' # take_addr_if_nonpointer(m) + 'self->' + attr + '[arg0]'
      set_call_content = '?' # 'self->' + attr + '[arg0] = ' + deref_if_nonpointer(m) + 'arg1'
      if m.getExtendedAttribute('BoundsChecked'):
        bounds_check = "array_bounds_check(sizeof(self->%s) / sizeof(self->%s[0]), arg0)" % (attr, attr)
        get_call_content = "(%s, %s)" % (bounds_check, get_call_content)
        set_call_content = "(%s, %s)" % (bounds_check, set_call_content)
    else:
      get_sigs = {0: []}
      set_sigs = {1: [Dummy({'type': m.type})]}
      get_call_content = '?' # take_addr_if_nonpointer(m) + 'self->' + attr
      set_call_content = '?' # 'self->' + attr + ' = ' + deref_if_nonpointer(m) + 'arg0'

    get_name = 'get_' + attr

    if not m.readonly:
      set_name = 'set_' + attr
      render_function(interfaces, output, name,
                      set_name, set_sigs, 'Void',
                      None,
                      None,
                      None,
                      False,
                      func_scope=interface,
                      call_content=set_call_content,
                      const=m.getExtendedAttribute('Const'),
                      array_attribute=m.type.isArray())

  if not interface.getExtendedAttribute('NoDelete'):
    render_function(interfaces, output, name,
                    '__destroy__', {0: []}, 'Void',
                    None,
                    None,
                    None,
                    False,
                    func_scope=interface,
                    call_content='delete self')
  
  output.mid_c += ['\n']
  output.mid_dart_dels += ['\n}\n']
  output.mid_dart_decs += ['\n}\n']

# enums 

# for name, enum in enums.items():
#   dart_code += ['enum ' + name[0].upper() + name[1:] + ' {\n']
#   for value in enum.values():
#     dart_code += ['  '+value.split('::')[-1].split('_')[-1]+',\n']
#   dart_code += ['}\n\n']

# write output

with open('out.c', 'w') as c:
  for x in output.mid_c:
    c.write(x)
with open('interface.dart', 'w') as dart:
  dart.write(pre_dart_itf)
  for x in output.mid_dart_itf:
    dart.write(x)
  dart.write('}')
with open('delegates.dart', 'w') as dart:
  dart.write(pre_dart_dels)
  for x in output.mid_dart_dels:
    dart.write(x)
with open('decorators.dart', 'w') as dart:
  dart.write(pre_dart_decs)
  for x in output.mid_dart_decs:
    dart.write(x)
