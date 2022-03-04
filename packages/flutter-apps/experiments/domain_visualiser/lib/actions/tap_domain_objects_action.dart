import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'tap_domain_objects_action.freezed.dart';
part 'tap_domain_objects_action.g.dart';

@freezed
class TapDomainObjectsAction with _$TapDomainObjectsAction, ReduxAction {
  static const String className = 'TapDomainObjectsAction';

  const TapDomainObjectsAction._();
  const factory TapDomainObjectsAction({@Default(false) bool turnOff}) =
      _TapDomainObjectsAction;

  factory TapDomainObjectsAction.fromJson(JsonMap json) =>
      _$TapDomainObjectsActionFromJson(json);

  @override
  String get typeName => className;
}
