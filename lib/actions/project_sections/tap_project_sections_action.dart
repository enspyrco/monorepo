import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'tap_project_sections_action.freezed.dart';
part 'tap_project_sections_action.g.dart';

@freezed
class TapProjectSectionsAction with _$TapProjectSectionsAction, ReduxAction {
  factory TapProjectSectionsAction({@Default(false) bool turnOff}) =
      _TapProjectSectionsAction;

  factory TapProjectSectionsAction.fromJson(Map<String, dynamic> json) =>
      _$TapProjectSectionsActionFromJson(json);
}
