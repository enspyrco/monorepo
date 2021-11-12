import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/src/auth/models/auth_user_data.dart';
import 'package:redfire/src/types/redux_action.dart';
import 'package:redfire/src/types/typedefs.dart';

part 'set_auth_user_data_action.freezed.dart';
part 'set_auth_user_data_action.g.dart';

@freezed
class SetAuthUserDataAction with _$SetAuthUserDataAction, ReduxAction {
  SetAuthUserDataAction._();
  factory SetAuthUserDataAction(AuthUserData? authUserData) =
      _SetAuthUserDataAction;

  factory SetAuthUserDataAction.fromJson(JsonMap json) =>
      _$SetAuthUserDataActionFromJson(json);

  @override
  String get typeName => 'SetAuthUserDataAction';
}
