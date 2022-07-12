/// https://pub.dev/documentation/googleapis/latest/firestore.v1/FieldFilter/op.html
String opString(
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull) {
  if (isEqualTo != null) return 'EQUAL';
  if (isNotEqualTo != null) return 'NOT_EQUAL';
  if (isLessThan != null) return 'LESS_THAN';
  if (isLessThanOrEqualTo != null) return 'LESS_THAN_OR_EQUAL';
  if (isGreaterThan != null) return 'GREATER_THAN';
  if (isGreaterThanOrEqualTo != null) return 'GREATER_THAN_OR_EQUAL';
  if (arrayContains != null) return 'ARRAY_CONTAINS';
  if (arrayContainsAny != null) return 'ARRAY_CONTAINS_ANY';
  if (whereIn != null) return 'IN';
  if (whereNotIn != null) return 'NOT_IN';
  return 'OPERATOR_UNSPECIFIED';
}
