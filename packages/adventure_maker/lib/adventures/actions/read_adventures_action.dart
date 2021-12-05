import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'read_adventures_action.freezed.dart';
part 'read_adventures_action.g.dart';

@freezed
class ReadAdventuresAction with _$ReadAdventuresAction, ReduxAction {
  static const String className = 'ReadAdventuresAction';

  const ReadAdventuresAction._();
  const factory ReadAdventuresAction() = _ReadAdventuresAction;

  factory ReadAdventuresAction.fromJson(JsonMap json) =>
      _$ReadAdventuresActionFromJson(json);

  @override
  String get typeName => className;
}
