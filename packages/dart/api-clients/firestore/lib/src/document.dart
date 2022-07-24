import 'package:firestore_service_interface/firestore_service_interface.dart';
import 'package:googleapis/firestore/v1.dart' as v1;
import 'package:googleapis_utils/googleapis_utils.dart';
import 'package:json_utils/json_utils.dart';

class DocumentGoogleApis implements Document {
  final String _id;
  final String _name;
  final JsonMap _fields;
  final String _createTime;
  final String _updateTime;

  DocumentGoogleApis.from(v1.Document doc)
      : _id = Uri.parse(doc.name ?? '?').pathSegments.last,
        _name = doc.name ?? '?',
        _fields = doc.fields.unwrapValues(),
        _createTime = doc.createTime!,
        _updateTime = doc.updateTime!;

  @override
  String get id => _id;

  @override
  String get path => _name;

  @override
  JsonMap get fields => _fields;

  @override
  String get createTime => _createTime;

  @override
  String get updateTime => _updateTime;
}
