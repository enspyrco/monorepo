import WebIDL
import json

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


for key in interfaces:
  interface = interfaces[key]
  ivars = vars(interface)
  for keyi in ivars:
    print(keyi, ivars[keyi]) # json.dumps(

# print(interfaces)
# print(implements)
# print(enums)
