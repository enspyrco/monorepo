import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'tap_organisations_action.freezed.dart';
part 'tap_organisations_action.g.dart';

@freezed
class TapOrganisationsAction with _$TapOrganisationsAction, ReduxAction {
  TapOrganisationsAction._();
  factory TapOrganisationsAction({@Default(false) bool turnOff}) =
      _TapOrganisationsAction;

  factory TapOrganisationsAction.fromJson(JsonMap json) =>
      _$TapOrganisationsActionFromJson(json);

  @override
  String get typeName => 'TapOrganisationsAction';
}
