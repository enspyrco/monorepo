import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

import '../models/domain_object.dart';

part 'add_domain_object_action.freezed.dart';
part 'add_domain_object_action.g.dart';

@freezed
class AddDomainObjectAction with _$AddDomainObjectAction, ReduxAction {
  static const String className = 'AddDomainObjectAction';

  const AddDomainObjectAction._();
  const factory AddDomainObjectAction(
      @DomainObjectConverter() DomainObject object) = _AddDomainObjectAction;

  factory AddDomainObjectAction.fromJson(JsonMap json) =>
      _$AddDomainObjectActionFromJson(json);

  @override
  String get typeName => className;
}
