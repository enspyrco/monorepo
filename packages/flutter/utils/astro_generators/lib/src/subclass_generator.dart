import 'package:analyzer/dart/element/element.dart';
import 'package:astro_generators/src/infos/field_info.dart';
import 'package:astro_types/astro_annotations.dart';
import 'package:build/build.dart' show BuildStep;
import 'package:source_gen/source_gen.dart';

import 'model_visitor.dart';

class SubclassGenerator extends GeneratorForAnnotation<AstroStateAnnotation> {
  @override
  String generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    final visitor = ModelVisitor();
    element.visitChildren(visitor);

    final List<FieldInfo> allFields =
        visitor.memberFields + visitor.inheritedFields;

    final className = 'Generated${visitor.className}';

    final classBuffer = StringBuffer();

    classBuffer.writeln('class $className implements ${visitor.className} {');

    classBuffer.writeln('$className({');

    for (final field in allFields) {
      classBuffer.writeln('required this.${field.name}, ');
    }

    classBuffer.writeln('});\n');

    for (final field in allFields) {
      classBuffer.writeln('@override\nfinal ${field.type} ${field.name};\n');
    }

    generateCopyWith(className, allFields, classBuffer);
    generateToJson(allFields, classBuffer);
    generateToString(allFields, classBuffer);
    generateHashCode(allFields, classBuffer);
    generateEquivalenceOperator(className, allFields, classBuffer);

    classBuffer.writeln('}');

    return classBuffer.toString();
  }
}

void generateCopyWith(
    String className, List<FieldInfo> fields, StringBuffer classBuffer) {
  classBuffer.writeln('@override\n$className copyWith({');

  for (final field in fields) {
    classBuffer.writeln('${field.type}? ${field.name},');
  }

  classBuffer.writeln('}) => $className(');

  for (final field in fields) {
    classBuffer.writeln('${field.name}: ${field.name} ?? this.${field.name},');
  }

  classBuffer.writeln(');\n');
}

void generateToJson(List<FieldInfo> fields, StringBuffer classBuffer) {
  classBuffer.writeln('@override\nMap<String, Object?> toJson() => {');

  for (final field in fields) {
    classBuffer.writeln('\'${field.name}\': ${field.name}, ');
  }

  classBuffer.writeln('};\n');
}

void generateToString(List<FieldInfo> fields, StringBuffer classBuffer) {
  classBuffer.writeln('@override\nString toString() =>');

  for (final field in fields) {
    classBuffer.writeln('\'${field.name}: \$${field.name}, \'');
  }

  classBuffer.writeln(';\n');
}

void generateHashCode(List<FieldInfo> fields, StringBuffer classBuffer) {
  if (fields.length == 1) {
    final FieldInfo field = fields.first;
    classBuffer
        .writeln('@override\nint get hashCode => ${field.name}.hashCode;\n');
    return;
  }

  classBuffer.writeln('@override\nint get hashCode => Object.hash(');

  for (final field in fields) {
    classBuffer.writeln('${field.name}, ');
  }

  classBuffer.writeln(');\n');
}

void generateEquivalenceOperator(
    String className, List<FieldInfo> fields, StringBuffer classBuffer) {
  classBuffer.writeln('@override\nbool operator==(Object other) => ');
  classBuffer.writeln('other is $className && ');

  int count = 0;
  String ending = ' && ';
  for (final field in fields) {
    if (++count == fields.length) ending = ';';
    classBuffer.writeln('${field.name} == other.${field.name}$ending');
  }
}
