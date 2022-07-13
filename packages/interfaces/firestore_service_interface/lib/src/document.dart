typedef JsonMap = Map<String, Object?>;

abstract class Document {
  String get id;
  String get path;
  JsonMap get fields;
}
