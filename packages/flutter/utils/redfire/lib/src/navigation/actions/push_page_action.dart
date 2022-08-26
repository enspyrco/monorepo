import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_types/json_types.dart';

import '../../types/redux_action.dart';
import '../models/page_data.dart';

part 'push_page_action.freezed.dart';
part 'push_page_action.g.dart';

@freezed
class PushPageAction with _$PushPageAction, ReduxAction {
  const PushPageAction._();
  const factory PushPageAction(@PageDataConverter() PageData page) =
      _PushPageAction;

  factory PushPageAction.fromJson(JsonMap json) =>
      _$PushPageActionFromJson(json);

  @override
  String get typeName => 'PushPageAction';
}
