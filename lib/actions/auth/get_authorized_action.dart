import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_process/actions/redux_action.dart';
import 'package:the_process/enums/auth/provider_name.dart';

part 'get_authorized_action.freezed.dart';
part 'get_authorized_action.g.dart';

@freezed
class GetAuthorizedAction with _$GetAuthorizedAction, ReduxAction {
  factory GetAuthorizedAction({required ProviderName provider}) =
      _GetAuthorizedAction;

  factory GetAuthorizedAction.fromJson(Map<String, dynamic> json) =>
      _$GetAuthorizedActionFromJson(json);
}
