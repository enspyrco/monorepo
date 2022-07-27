import 'dart:typed_data';

import 'package:googleapis/firestore/v1.dart';

typedef JsonMap = Map<String, Object?>;
typedef JsonList = List<Object?>;

abstract class ReduxModel {
  JsonMap toJson();
}

extension JsonMapExtension on JsonMap {
  Document toDocument() {
    var document = Document()..fields = {};
    forEach((key, value) {
      document.fields![key] = TypeUtil.encode(value);
    });
    return document;
  }
}

// Adapted from: https://github.com/cachapa/firedart/blob/master/lib/firestore/type_util.dart

abstract class TypeUtil {
  static Value encode(dynamic value) {
    if (value == null) {
      return Value(nullValue: "NULL_VALUE");
    }
    if (value is bool) {
      return Value(booleanValue: value);
    }
    if (value is int) {
      return Value(integerValue: value.toString());
    }
    if (value is double) {
      return Value(doubleValue: value);
    }
    if (value is DateTime) {
      return Value(timestampValue: value.microsecondsSinceEpoch.toString());
    }
    if (value is String) {
      return Value(stringValue: value);
    }
    if (value is List) {
      return Value(
        arrayValue: ArrayValue(
          values: value.map((e) => encode(e)).toList(),
        ),
      );
    }
    if (value is Map) {
      return Value(
        mapValue: MapValue(
          fields: value.map(
            (key, val) => MapEntry(
              key,
              encode(val),
            ),
          ),
        ),
      );
    }
    if (value is Uint8List) {
      return Value(bytesValue: value.toString());
    }
    // if (value is DocumentReference) {
    //   return Value()..referenceValue = value.fullPath;
    // }
    // if (value is GeoPoint) {
    //   return Value()..geoPointValue = value.toLatLng();
    // }

    throw Exception('Unknown type: ${value.runtimeType}');
  }

  // static dynamic decode(fs.Value value, FirestoreGateway gateway) {
  //   switch (value.whichValueType()) {
  //     case fs.Value_ValueType.nullValue:
  //       return null;
  //     case fs.Value_ValueType.booleanValue:
  //       return value.booleanValue;
  //     case fs.Value_ValueType.doubleValue:
  //       return value.doubleValue;
  //     case fs.Value_ValueType.stringValue:
  //       return value.stringValue;
  //     case fs.Value_ValueType.integerValue:
  //       return value.integerValue.toInt();
  //     case fs.Value_ValueType.timestampValue:
  //       return value.timestampValue.toDateTime().toLocal();
  //     case fs.Value_ValueType.bytesValue:
  //       return value.bytesValue;
  //     case fs.Value_ValueType.referenceValue:
  //       return DocumentReference(gateway, value.referenceValue);
  //     case fs.Value_ValueType.geoPointValue:
  //       return GeoPoint.fromLatLng(value.geoPointValue);
  //     case fs.Value_ValueType.arrayValue:
  //       return value.arrayValue.values
  //           .map((item) => decode(item, gateway))
  //           .toList(growable: false);
  //     case fs.Value_ValueType.mapValue:
  //       return value.mapValue.fields
  //           .map((key, value) => MapEntry(key, decode(value, gateway)));
  //     default:
  //       throw Exception('Unrecognized type: ${value.whichValueType()}');
  //   }
  // }
}
