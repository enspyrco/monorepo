import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_process/actions/redux_action.dart';
import 'package:the_process/enums/database/database_section.dart';

part 'connect_database.freezed.dart';
part 'connect_database.g.dart';

@freezed
class ConnectDatabase with _$ConnectDatabase, ReduxAction {
  factory ConnectDatabase({required DatabaseSection section}) =
      _ConnectDatabase;

  factory ConnectDatabase.fromJson(Map<String, dynamic> json) =>
      _$ConnectDatabaseFromJson(json);
}
