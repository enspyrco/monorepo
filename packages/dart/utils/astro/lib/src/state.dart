import 'package:astro_error_handling/astro_error_handling.dart';
import 'package:json_types/json_types.dart';
import 'package:meta/meta.dart';

@immutable
abstract class State {
  State copyWith();
  Json toJson();
}

abstract class RootState extends State with AstroErrorHandling {}
