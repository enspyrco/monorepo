import 'dart:ui';

import 'package:flame/effects.dart';
import 'package:tech_world/shared/direction_enum.dart';
import 'package:tech_world/utils/extensions/vector2_extension.dart';

/// Adapted from https://github.com/flame-engine/flame/blob/main/packages/flame/lib/src/effects/move_effect.dart
/// TODO: Make a proper pass at removing unneeded code due to knowing what the
/// values of the super class will be (eg. isRelative is always false)
class MoveCharacterEffect extends PositionComponentEffect {
  final List<Vector2> _path;
  final List<Vector2Percentage> _percentagePath = <Vector2Percentage>[];
  final _directions = <DirectionEnum>[];
  final Function(DirectionEnum) _onDirectionChange;
  Vector2Percentage? _currentSubPath;
  late DirectionEnum _currentDirection;

  ///
  MoveCharacterEffect({
    required List<Vector2> path,
    required double speed,
    required DirectionEnum startingDirection,
    required Function(DirectionEnum) onDirectionChange,
    bool? removeOnFinish,
    VoidCallback? onComplete,
  })  : _path = path,
        _currentDirection = startingDirection,
        _onDirectionChange = onDirectionChange,
        super(
          false,
          false,
          speed: speed,
          modifiesPosition: true,
          removeOnFinish: removeOnFinish,
          onComplete: onComplete,
        ) {
    for (int i = 0; i < _path.length - 1; i++) {
      final subPathVector = _path[i + 1] - _path[i];
      _directions.insert(i, subPathVector.toDirection());
    }
    // add a last vector so [directions] has the same length as [path]
    if (_directions.isNotEmpty) {
      _directions.insert(_path.length - 1, _directions.last);
    }
  }

  @override
  Future<void> onLoad() async {
    super.onLoad();

    peakPosition = _path.last;

    var pathLength = 0.0;
    var lastPosition = originalPosition!;
    for (final v in _path) {
      pathLength += v.distanceTo(lastPosition);
      lastPosition = v;
    }

    lastPosition = originalPosition!;
    for (final v in _path) {
      final lengthToPrevious = lastPosition.distanceTo(v);
      final lastEndAt =
          _percentagePath.isNotEmpty ? _percentagePath.last.endAt : 0.0;
      final endPercentage = lastEndAt + lengthToPrevious / pathLength;
      _percentagePath.add(
        Vector2Percentage(
            v, lastPosition, lastEndAt, _path.last == v ? 1.0 : endPercentage),
      );
      lastPosition = v;
    }
    speed ??= pathLength / duration!;

    // `duration` is not null when speed is null
    duration ??= pathLength / speed!;
    duration = duration! + totalOffset;
    setPeakTimeFromDuration(duration!);
  }

  @override
  void resetEffect() {
    super.resetEffect();
    if (_percentagePath.isNotEmpty) {
      _currentSubPath = _percentagePath.first;
    }
  }

  @override
  void update(double dt) {
    if (isPaused) {
      return;
    }
    super.update(dt);
    if (hasCompleted()) {
      return;
    }
    _currentSubPath ??= _percentagePath.first;
    if (!curveDirection.isNegative && _currentSubPath!.endAt < curveProgress ||
        curveDirection.isNegative && _currentSubPath!.startAt > curveProgress) {
      _currentSubPath =
          _percentagePath.firstWhere((v) => v.endAt >= curveProgress);
    }
    final lastEndAt = _currentSubPath!.startAt;
    final localPercentage =
        (curveProgress - lastEndAt) / (_currentSubPath!.endAt - lastEndAt);
    affectedParent.position.setFrom(_currentSubPath!.previous +
        ((_currentSubPath!.v - _currentSubPath!.previous) * localPercentage));

    // calculate the current direction and set if changed
    final index = (curveProgress * (_directions.length - 1)).floor();
    var direction = _directions[(index - 1).abs()];
    if (direction != _currentDirection) {
      _currentDirection = direction;
      _onDirectionChange(_currentDirection);
    }
  }
}
