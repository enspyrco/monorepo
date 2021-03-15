import 'package:flireator/models/auth/auth_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../redux_action.dart';

part 'store_auth_data_action.freezed.dart';
part 'store_auth_data_action.g.dart';

@freezed
class StoreAuthDataAction with _$StoreAuthDataAction, ReduxAction {
  factory StoreAuthDataAction({AuthData? data}) = _StoreAuthDataAction;

  factory StoreAuthDataAction.fromJson(Map<String, dynamic> json) =>
      _$StoreAuthDataActionFromJson(json);
}
