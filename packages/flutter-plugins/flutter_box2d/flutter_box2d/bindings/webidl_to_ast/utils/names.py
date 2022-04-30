from utils.utils import lower_first, upper_first

class Names:
  def __init__(self, class_name, func_name, attr_name=None, attr_type=None):
    self.class_name = class_name
    self.func_name = func_name
    self.attr_name = attr_name
    self.attr_type = attr_type
    self.bindings_name = class_name + '_' + func_name
    self.dart_class_name = upper_first(self.class_name)
    self.del_class_name = self.dart_class_name + 'Platform'
    self.dart_func_name = lower_first(self.func_name)
