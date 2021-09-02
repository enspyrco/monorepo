import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/src/types/redux_action.dart';
import 'package:redfire/src/types/typedefs.dart';

part 'store_theme_mode_action.freezed.dart';
part 'store_theme_mode_action.g.dart';

@freezed
class StoreThemeModeAction with _$StoreThemeModeAction, ReduxAction {
  factory StoreThemeModeAction(int themeMode) = _StoreThemeModeAction;

  factory StoreThemeModeAction.fromJson(JsonMap json) =>
      _$StoreThemeModeActionFromJson(json);
}
