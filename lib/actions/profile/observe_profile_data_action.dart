import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_process/actions/redux_action.dart';

part 'observe_profile_data_action.freezed.dart';
part 'observe_profile_data_action.g.dart';

@freezed
class ObserveProfileDataAction with _$ObserveProfileDataAction, ReduxAction {
  factory ObserveProfileDataAction() = _ObserveProfileDataAction;

  factory ObserveProfileDataAction.fromJson(Map<String, dynamic> json) =>
      _$ObserveProfileDataActionFromJson(json);
}
