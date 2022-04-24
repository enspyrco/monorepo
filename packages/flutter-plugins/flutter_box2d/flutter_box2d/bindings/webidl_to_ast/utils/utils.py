class Dummy:
  def __init__(self, init):
    for k, v in init.items():
      self.__dict__[k] = v

  def getExtendedAttribute(self, name): # noqa: U100
    return None

def upper_first(text):
  return text[0].upper() + text[1:]

def lower_first(text):
  return text[0].lower() + text[1:]

# Compute the height in the inheritance tree of each node. Note that the order of interation
# of `implements` is irrelevant.
#
# After one iteration of the loop, all ancestors of child are guaranteed to have a a larger
# height number than the child, and this is recursively true for each ancestor. If the height
# of child is later increased, all its ancestors will be readjusted at that time to maintain
# that invariant. Further, the height of a node never decreases. Therefore, when the loop
# finishes, all ancestors of a given node should have a larger height number than that node.
def find_node_heights(implements):
  nodeHeight = {}
  for child, parent in implements.items():
    parent = parent[0]
    while parent:
      nodeHeight[parent] = max(nodeHeight.get(parent, 0), nodeHeight.get(child, 0) + 1)
      grandParent = implements.get(parent)
      if grandParent:
        child = parent
        parent = grandParent[0]
      else:
        parent = None
  return nodeHeight

def full_typename(arg):
  return ('const ' if arg.getExtendedAttribute('Const') else '') + arg.type.name + ('[]' if arg.type.isArray() else '')





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

