import 'package:json_types/json_types.dart';
import 'package:meta/meta.dart';

@immutable
abstract class State {
  State copyWith();
  Json toJson();
}
