library astro_state_interface;

import 'package:json_types/json_types.dart';
import 'package:meta/meta.dart';

@immutable
mixin AstroState {
  AstroState copyWith();
  Json toJson();
}
