import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_types/json_types.dart';

import '../../../../types.dart';

part 'get_providers_for_email_action.freezed.dart';
part 'get_providers_for_email_action.g.dart';

@freezed
class GetProvidersForEmailAction
    with _$GetProvidersForEmailAction, ReduxAction {
  const GetProvidersForEmailAction._();
  const factory GetProvidersForEmailAction(String email) =
      _GetProvidersForEmailAction;

  factory GetProvidersForEmailAction.fromJson(JsonMap json) =>
      _$GetProvidersForEmailActionFromJson(json);

  @override
  String get typeName => 'GetProvidersForEmailAction';
}
