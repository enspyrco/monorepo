import 'package:flireator/models/flireator/flireator.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../redux_action.dart';

part 'store_flireator_action.freezed.dart';
part 'store_flireator_action.g.dart';

@freezed
class StoreFlireatorAction with _$StoreFlireatorAction, ReduxAction {
  factory StoreFlireatorAction({required Flireator flireator}) =
      _StoreFlireatorAction;

  factory StoreFlireatorAction.fromJson(Map<String, dynamic> json) =>
      _$StoreFlireatorActionFromJson(json);
}
