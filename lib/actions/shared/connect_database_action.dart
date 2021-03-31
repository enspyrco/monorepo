import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_process/actions/redux_action.dart';
import 'package:the_process/enums/database/database_section.dart';

part 'connect_database_action.freezed.dart';
part 'connect_database_action.g.dart';

@freezed
class ConnectDatabaseAction with _$ConnectDatabaseAction, ReduxAction {
  factory ConnectDatabaseAction({required DatabaseSection section}) =
      _ConnectDatabaseAction;

  factory ConnectDatabaseAction.fromJson(Map<String, dynamic> json) =>
      _$ConnectDatabaseActionFromJson(json);
}
