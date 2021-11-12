import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/src/types/redux_action.dart';
import 'package:redfire/src/types/typedefs.dart';

part 'set_theme_mode_action.freezed.dart';
part 'set_theme_mode_action.g.dart';

@freezed
class SetThemeModeAction with _$SetThemeModeAction, ReduxAction {
  SetThemeModeAction._();
  factory SetThemeModeAction(int themeMode) = _SetThemeModeAction;

  factory SetThemeModeAction.fromJson(JsonMap json) =>
      _$SetThemeModeActionFromJson(json);

  @override
  String get typeName => 'SetThemeModeAction';
}
