import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'tap_sections_action.freezed.dart';
part 'tap_sections_action.g.dart';

@freezed
class TapSectionsAction with _$TapSectionsAction, ReduxAction {
  const TapSectionsAction._();
  const factory TapSectionsAction({@Default(false) bool turnOff}) =
      _TapSectionsAction;

  factory TapSectionsAction.fromJson(JsonMap json) =>
      _$TapSectionsActionFromJson(json);

  @override
  String get typeName => 'TapSectionsAction';
}
