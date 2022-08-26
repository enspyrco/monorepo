import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_types/json_types.dart';

import '../../../types.dart';

part 'set_profile_data_action.freezed.dart';
part 'set_profile_data_action.g.dart';

@freezed
class SetProfileDataAction with _$SetProfileDataAction, ReduxAction {
  const SetProfileDataAction._();
  const factory SetProfileDataAction({required ProfileData data}) =
      _SetProfileDataAction;

  factory SetProfileDataAction.fromJson(JsonMap json) =>
      _$SetProfileDataActionFromJson(json);

  @override
  String get typeName => 'SetProfileDataAction';
}
