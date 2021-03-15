import 'package:freezed_annotation/freezed_annotation.dart';

import '../redux_action.dart';

part 'retrieve_flireator_data_action.freezed.dart';
part 'retrieve_flireator_data_action.g.dart';

@freezed
class RetrieveFlireatorDataAction
    with _$RetrieveFlireatorDataAction, ReduxAction {
  factory RetrieveFlireatorDataAction({required String userId}) =
      _RetrieveFlireatorDataAction;

  factory RetrieveFlireatorDataAction.fromJson(Map<String, dynamic> json) =>
      _$RetrieveFlireatorDataActionFromJson(json);
}
