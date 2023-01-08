import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';

import '../infos/field_info.dart';

extension FieldElementExtension on FieldElement {
  FieldInfo toFieldInfo() {
    return FieldInfo(
      typeName: type.getDisplayString(withNullability: true),
      typeNameWithoutNullability: type.getDisplayString(withNullability: false),
      hasNullableType: type.nullabilitySuffix == NullabilitySuffix.question,
      name: name,
    );
  }
}
