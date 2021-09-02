import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/src/auth/models/auth_user_data.dart';
import 'package:redfire/src/types/redux_action.dart';
import 'package:redfire/src/types/typedefs.dart';

part 'store_auth_user_data_action.freezed.dart';
part 'store_auth_user_data_action.g.dart';

@freezed
class StoreAuthUserDataAction with _$StoreAuthUserDataAction, ReduxAction {
  factory StoreAuthUserDataAction(AuthUserData? authUserData) =
      _StoreAuthUserDataAction;

  factory StoreAuthUserDataAction.fromJson(JsonMap json) =>
      _$StoreAuthUserDataActionFromJson(json);
}
