import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

import '../models/domain_object.dart';

part 'update_domain_object_action.freezed.dart';
part 'update_domain_object_action.g.dart';

@freezed
class UpdateDomainObjectAction with _$UpdateDomainObjectAction, ReduxAction {
  static const String className = 'UpdateDomainObjectAction';

  const UpdateDomainObjectAction._();
  const factory UpdateDomainObjectAction(
      @DomainObjectConverter() DomainObject object) = _UpdateDomainObjectAction;

  factory UpdateDomainObjectAction.fromJson(JsonMap json) =>
      _$UpdateDomainObjectActionFromJson(json);

  @override
  String get typeName => className;
}
