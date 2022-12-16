import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/visitor.dart';

// 1
class ModelVisitor extends SimpleElementVisitor<void> {
  // 2
  late String className;
  final fields = <String, dynamic>{};

  // 3
  @override
  void visitConstructorElement(ConstructorElement element) {
    final elementReturnType = element.type.returnType.toString();
    // 4
    className = elementReturnType.replaceFirst('*', '');
  }

  // 5
  @override
  void visitFieldElement(FieldElement element) {
    final elementType = element.type.toString();
    // 7
    fields[element.name] = elementType.replaceFirst('*', '');
  }
}
