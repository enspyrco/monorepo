import 'package:meta/meta.dart';

import 'json_types.dart';

@immutable
abstract class AstroState {
  const AstroState();

  AstroState copyWith();
  Json toJson();
}
