import emscripten.WebIDL as WebIDL
from utils.utils import Dummy, upper_first, find_node_heights, take_addr_if_nonpointer, deref_if_nonpointer
from utils.render_function import render_function
from utils.output import ClassSet, Output
from utils.names import Names

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

nodeHeights = find_node_heights(implements)
names = sorted(interfaces.keys(), key=lambda x: nodeHeights.get(x, 0), reverse=True)

out = Output()

for name in names:
  # if (name != 'b2PolygonShape'): #  and name != 'b2Vec2'
  #   continue

  interface = interfaces[name]

  # there is a ctor() function in WebIDL.Interface but it just checks for a member with name 'constructor'
  hasCtor = False
  for m in interface.members:
    if not m.isMethod():
      continue
    if m.identifier.name == name: hasCtor = True
  
  class_set = ClassSet(name, hasCtor)

  # Interface members
  ###################

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

    render_function(interfaces, enums, class_set, Names(name, m.identifier.name), sigs, return_type,
                    m.getExtendedAttribute('Ref'),
                    m.getExtendedAttribute('Value'),
                    (m.getExtendedAttribute('Operator') or [None])[0],
                    constructor,
                    func_scope=m.parentScope.identifier.name,
                    const=m.getExtendedAttribute('Const'))

  # Attributes
  for m in interface.members:
    if not m.isAttr():
      continue
    attr = m.identifier.name

    if m.type.isArray():
      get_sigs = {1: [Dummy({'type': WebIDL.BuiltinTypes[WebIDL.IDLBuiltinType.Types.long]})]}
      set_sigs = {2: [Dummy({'type': WebIDL.BuiltinTypes[WebIDL.IDLBuiltinType.Types.long]}),
                      Dummy({'type': m.type})]}
      get_call_content = take_addr_if_nonpointer(m) + 'self->' + attr + '[arg0]'
      set_call_content = 'self->' + attr + '[arg0] = ' + deref_if_nonpointer(m) + 'arg1'
      if m.getExtendedAttribute('BoundsChecked'):
        bounds_check = "array_bounds_check(sizeof(self->%s) / sizeof(self->%s[0]), arg0)" % (attr, attr)
        get_call_content = "(%s, %s)" % (bounds_check, get_call_content)
        set_call_content = "(%s, %s)" % (bounds_check, set_call_content)
    else:
      get_sigs = {0: []}
      set_sigs = {1: [Dummy({'type': m.type})]}
      get_call_content = take_addr_if_nonpointer(m) + 'self->' + attr
      set_call_content = 'self->' + attr + ' = ' + deref_if_nonpointer(m) + 'arg0'

    render_function(interfaces, enums, class_set, Names(name, 'get_' + attr), get_sigs, m.type.name,
                    None,
                    None,
                    None,
                    False,
                    func_scope=interface,
                    call_content=get_call_content,
                    const=m.getExtendedAttribute('Const'),
                    array_attribute=m.type.isArray())

    if not m.readonly:
      render_function(interfaces, enums, class_set, Names(name, 'set_' + attr), set_sigs, 'Void',
                      None,
                      None,
                      None,
                      False,
                      func_scope=interface,
                      call_content=set_call_content,
                      const=m.getExtendedAttribute('Const'),
                      array_attribute=m.type.isArray())

  if not interface.getExtendedAttribute('NoDelete'):
    render_function(interfaces, enums, class_set, Names(name, '__destroy__'), {0: []}, 'Void',
                    None,
                    None,
                    None,
                    False,
                    func_scope=interface,
                    call_content='delete self')
  
  out.finishThenAdd(class_set)

# enums 

for name, enum in enums.items():
  enum_name = upper_first(name)
  out.enums += ['enum ' + enum_name + ' {\n']
  for value in enum.values():
    out.enums += ['  '+value.split('::')[-1].split('_')[-1]+',\n']
  out.enums += ['}\n\n']
  out.enums += ['const ' + name + 'Map = {\n']
  i = 0
  for value in enum.values():
    out.enums += ['  %s: %s.' % (i, enum_name) +value.split('::')[-1].split('_')[-1]+',\n']
    i += 1
  out.enums += ['};\n\n']
  out.enums += ['extension ' + enum_name + 'IntExtension on int {\n']
  out.enums += ['  to%s() => %sMap[this]!;\n' % (enum_name, name)]
  out.enums += ['}\n\n']

# write output

out.writeToFiles()
