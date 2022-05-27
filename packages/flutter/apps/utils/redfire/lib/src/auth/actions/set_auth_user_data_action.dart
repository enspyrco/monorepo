import 'package:freezed_annotation/freezed_annotation.dart';

import '../../types/redux_action.dart';
import '../../types/typedefs.dart';
import '../models/auth_user_data.dart';

part 'set_auth_user_data_action.freezed.dart';
part 'set_auth_user_data_action.g.dart';

@freezed
class SetAuthUserDataAction with _$SetAuthUserDataAction, ReduxAction {
  const SetAuthUserDataAction._();
  const factory SetAuthUserDataAction(AuthUserData? authUserData) =
      _SetAuthUserDataAction;

  factory SetAuthUserDataAction.fromJson(JsonMap json) =>
      _$SetAuthUserDataActionFromJson(json);

  @override
  String get typeName => 'SetAuthUserDataAction';
}
