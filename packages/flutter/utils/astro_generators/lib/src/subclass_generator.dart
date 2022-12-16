import 'package:analyzer/dart/element/element.dart';
import 'package:astro_types/astro_annotations.dart';
import 'package:build/build.dart' show BuildStep;
import 'package:source_gen/source_gen.dart';

import 'model_visitor.dart';

class SubclassGenerator extends GeneratorForAnnotation<SubclassAnnotation> {
  @override
  String generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    final visitor = ModelVisitor();
    element.visitChildren(visitor);

    final className = 'Generated${visitor.className}';

    final classBuffer = StringBuffer();

    classBuffer.writeln('class $className implements ${visitor.className} {');

    classBuffer.writeln('$className({');

    for (final fieldName in visitor.fields.keys) {
      classBuffer.writeln('required this.$fieldName, ');
    }

    classBuffer.writeln('});\n');

    for (final fieldEntry in visitor.fields.entries) {
      classBuffer
          .writeln('@override\nfinal ${fieldEntry.value} ${fieldEntry.key};\n');
    }

    generateCopyWith(className, visitor, classBuffer);
    generateToJson(visitor, classBuffer);
    generateToString(visitor, classBuffer);
    generateHashCode(visitor, classBuffer);
    generateEquivalenceOperator(className, visitor, classBuffer);

    classBuffer.writeln('}');

    return classBuffer.toString();
  }
}

void generateCopyWith(
    String className, ModelVisitor visitor, StringBuffer classBuffer) {
  classBuffer.writeln('@override\n$className copyWith({');

  for (final fieldEntry in visitor.fields.entries) {
    classBuffer.writeln('${fieldEntry.value}? ${fieldEntry.key},');
  }

  classBuffer.writeln('}) => $className(');

  for (final fieldEntry in visitor.fields.entries) {
    classBuffer.writeln(
        '${fieldEntry.key}: ${fieldEntry.key} ?? this.${fieldEntry.key},');
  }

  classBuffer.writeln(');\n');
}

void generateToJson(ModelVisitor visitor, StringBuffer classBuffer) {
  classBuffer.writeln('@override\nJsonMap toJson() => {');

  for (final fieldName in visitor.fields.keys) {
    classBuffer.writeln('\'$fieldName\': $fieldName, ');
  }

  classBuffer.writeln('};\n');
}

void generateToString(ModelVisitor visitor, StringBuffer classBuffer) {
  classBuffer.writeln('@override\nString toString() =>');

  for (final fieldName in visitor.fields.keys) {
    classBuffer.writeln('\'$fieldName: \$$fieldName, \'');
  }

  classBuffer.writeln(';\n');
}

void generateHashCode(ModelVisitor visitor, StringBuffer classBuffer) {
  classBuffer.writeln('@override\nint get hashCode => Object.hash(');

  for (final fieldName in visitor.fields.keys) {
    classBuffer.writeln('$fieldName, ');
  }

  classBuffer.writeln(');\n');
}

void generateEquivalenceOperator(
    String className, ModelVisitor visitor, StringBuffer classBuffer) {
  classBuffer.writeln('@override\nbool operator==(Object other) => ');
  classBuffer.writeln('other is $className && ');

  int count = 0;
  String ending = ' && ';
  for (final fieldName in visitor.fields.keys) {
    if (++count == visitor.fields.keys.length) ending = ';';
    classBuffer.writeln('$fieldName == other.$fieldName$ending');
  }
}
