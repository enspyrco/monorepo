import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_process/actions/redux_action.dart';
import 'package:the_process/models/auth/auth_user_data.dart';

part 'store_auth_user_data_action.freezed.dart';
part 'store_auth_user_data_action.g.dart';

@freezed
class StoreAuthUserDataAction with _$StoreAuthUserDataAction, ReduxAction {
  factory StoreAuthUserDataAction({AuthUserData? authUserData}) =
      _StoreAuthUserDataAction;

  factory StoreAuthUserDataAction.fromJson(Map<String, dynamic> json) =>
      _$StoreAuthUserDataActionFromJson(json);
}
