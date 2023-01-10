import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/visitor.dart';

import 'extensions/field_element_extension.dart';
import 'infos/field_info.dart';
import 'infos/interface_info.dart';

class ModelVisitor extends SimpleElementVisitor<void> {
  late String className;
  final implementedInterfaces = <InterfaceInfo>[];
  final memberFields = <FieldInfo>[];
  final inheritedFields = <FieldInfo>[];

  @override
  void visitConstructorElement(ConstructorElement element) {
    final elementReturnType = element.type.returnType.toString();
    className = elementReturnType.replaceFirst('*', '');

    implementedInterfaces.addAll(element.enclosingElement.getInfos());
    implementedInterfaces.fold(inheritedFields,
        (previous, element) => previous..addAll(element.fields));
  }

  @override
  void visitFieldElement(FieldElement element) {
    memberFields.add(element.toFieldInfo());
  }
}

extension InterfaceElementExtension on InterfaceElement {
  List<InterfaceInfo> getInfos() {
    return [
      ...interfaces
          .map((e) => InterfaceInfo(e.element.name, e.element.fields.toInfos()))
    ];
  }
}

extension FieldElementsListExtension on List<FieldElement> {
  List<FieldInfo> toInfos() => [...map((e) => e.toFieldInfo())];
}
