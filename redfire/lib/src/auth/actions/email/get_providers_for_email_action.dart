import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'get_providers_for_email_action.freezed.dart';
part 'get_providers_for_email_action.g.dart';

@freezed
class GetProvidersForEmailAction
    with _$GetProvidersForEmailAction, ReduxAction {
  factory GetProvidersForEmailAction(String email) =
      _GetProvidersForEmailAction;

  factory GetProvidersForEmailAction.fromJson(JsonMap json) =>
      _$GetProvidersForEmailActionFromJson(json);
}
