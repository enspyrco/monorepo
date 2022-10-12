import 'package:meta/meta.dart';

import 'json_types.dart';

@immutable
abstract class AstroState {
  AstroState copyWith();
  Json toJson();
}
