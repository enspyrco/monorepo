import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

import '../models/domain_object.dart';

part 'set_domain_objects_action.freezed.dart';
part 'set_domain_objects_action.g.dart';

@freezed
class SetDomainObjectsAction with _$SetDomainObjectsAction, ReduxAction {
  static const String className = 'SetDomainObjectsAction';

  const SetDomainObjectsAction._();
  const factory SetDomainObjectsAction(
          @DomainObjectConverter() ISet<DomainObject> objects) =
      _SetDomainObjectsAction;

  factory SetDomainObjectsAction.fromJson(JsonMap json) =>
      _$SetDomainObjectsActionFromJson(json);

  @override
  String get typeName => className;
}
