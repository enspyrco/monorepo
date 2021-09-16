import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'set_providers_for_email_action.freezed.dart';
part 'set_providers_for_email_action.g.dart';

@freezed
class SetProvidersForEmailAction
    with _$SetProvidersForEmailAction, ReduxAction {
  factory SetProvidersForEmailAction(List<String> methods) =
      _SetProvidersForEmailAction;

  factory SetProvidersForEmailAction.fromJson(JsonMap json) =>
      _$SetProvidersForEmailActionFromJson(json);
}
