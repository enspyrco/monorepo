import 'package:vector_math/vector_math_64.dart';

import '../../shared/direction_enum.dart';
import '../movement_vector.dart';

extension DirectionExtension on DirectionEnum? {
  Vector2 get vector => MovementVector.toward(this ?? DirectionEnum.up);
}
