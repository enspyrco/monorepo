/// A package whose only purpose is to provide typedefs for apps using JSON data.
/// This helps to avoid type conflicts between packages that depend on other
/// packages defining the same type.
library json_types;

typedef JsonMap = Map<String, dynamic>;
typedef JsonList = List<dynamic>;
typedef Json = dynamic;
