import 'dart:typed_data';

import 'package:firestore_service_interface/firestore_service_interface.dart'
    as our;
import 'package:googleapis/firestore/v1.dart';
import 'package:json_utils/json_utils.dart';

extension JsonMapExtension on JsonMap {
  Document toDocument() {
    var document = Document()..fields = {};
    forEach((key, value) {
      document.fields![key] = TypeUtil.encode(value);
    });
    return document;
  }
}

extension FieldsExtension on Map<String, Value>? {
  JsonMap unwrapValues() => (this == null)
      ? {}
      : this!.map((key, value) => MapEntry(key, TypeUtil.decode(value)));
}

extension NullableObjectExtension on Object? {
  Value toValue() => TypeUtil.encode(this);
}

// Adapted from: https://github.com/cachapa/firedart/blob/master/lib/firestore/type_util.dart

abstract class TypeUtil {
  static Value encode(Object? value) {
    if (value == null) return Value(nullValue: 'NULL_VALUE');
    if (value is bool) return Value(booleanValue: value);
    if (value is int) return Value(integerValue: value.toString());
    if (value is double) return Value(doubleValue: value);
    if (value is DateTime) {
      return Value(timestampValue: value.microsecondsSinceEpoch.toString());
    }
    if (value is String) return Value(stringValue: value);
    if (value is List) {
      return Value(
          arrayValue: ArrayValue(values: value.map((e) => encode(e)).toList()));
    }
    if (value is Map) {
      return Value(
          mapValue: MapValue(
              fields: value.map((key, val) => MapEntry(key, encode(val)))));
    }
    if (value is Uint8List) return Value(bytesValue: value.toString());

    // if (value is DocumentReference) {
    //   return Value()..referenceValue = value.fullPath;
    // }
    // if (value is GeoPoint) {
    //   return Value()..geoPointValue = value.toLatLng();
    // }

    throw Exception('Unknown type: ${value.runtimeType}');
  }

  static Object? decode(Value value) {
    if (value.nullValue != null) return null;
    if (value.booleanValue != null) return value.booleanValue;
    if (value.doubleValue != null) return value.doubleValue;
    if (value.stringValue != null) return value.stringValue;
    if (value.integerValue != null) return int.parse(value.integerValue!);
    if (value.timestampValue != null) {
      return DateTime.parse(value.timestampValue!);
    }
    if (value.bytesValue != null) return value.bytesValue;
    if (value.referenceValue != null) {
      return null; // DocumentReference(gateway, value.referenceValue);
    }
    if (value.geoPointValue != null) {
      return null; // GeoPoint.fromLatLng(value.geoPointValue);
    }
    if (value.arrayValue != null) {
      return value.arrayValue!.values!.map(decode).toList(growable: false);
    }
    if (value.mapValue != null) {
      return value.mapValue!.fields!
          .map((key, value) => MapEntry(key, decode(value)));
    }
    throw Exception('Unrecognized type for Value: $value');
  }
}

extension DocumentExtension on Document {
  our.Document toOurDocument() => our.Document(
      id: Uri.parse(name!).pathSegments.last,
      path: name!,
      fields: fields.unwrapValues(),
      createTime: createTime,
      updateTime: updateTime);
}
