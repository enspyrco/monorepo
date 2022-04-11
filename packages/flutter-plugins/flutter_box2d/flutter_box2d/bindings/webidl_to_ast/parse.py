import WebIDL
import jsonpickle
from json import JSONEncoder

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

# print(interfaces)
# print(implements)
# print(enums)

interfacesJson = jsonpickle.encode(interfaces)
with open("interfaces.json", "w") as text_file:
    print(interfacesJson, file=text_file)
implementsJson = jsonpickle.encode(implements)
with open("implements.json", "w") as text_file:
    print(implementsJson, file=text_file)
enumsJson = jsonpickle.encode(enums)
with open("enums.json", "w") as text_file:
    print(enumsJson, file=text_file)
