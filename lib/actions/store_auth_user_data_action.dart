import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/auth/models/auth_user_data.dart';
import 'package:redfire/types/redux_action.dart';

part 'store_auth_user_data_action.freezed.dart';
part 'store_auth_user_data_action.g.dart';

@freezed
class StoreAuthUserDataAction with _$StoreAuthUserDataAction, ReduxAction {
  factory StoreAuthUserDataAction(AuthUserData? authUserData) =
      _StoreAuthUserDataAction;

  factory StoreAuthUserDataAction.fromJson(Map<String, dynamic> json) =>
      _$StoreAuthUserDataActionFromJson(json);
}
