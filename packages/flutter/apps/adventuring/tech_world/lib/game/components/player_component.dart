import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flutter/services.dart';

import '../../shared/direction_enum.dart';
import '../../utils/input.dart';

typedef Position = Vector2;

class PlayerComponent extends SpriteAnimationGroupComponent<DirectionEnum> {
  // Private constructor - the async create method is how an object is created.
  PlayerComponent._(
      Map<DirectionEnum, SpriteAnimation> animations, Position start)
      : super(
            size: Vector2(64, 64),
            position: start,
            animations: animations,
            current: DirectionEnum.down);

  // MoveCharacterEffect? _moveEffect;

  // Static async create method so we can load sprite animations.
  static Future<PlayerComponent> create(String path,
      {required Position start}) async {
    final animations = <DirectionEnum, SpriteAnimation>{};

    // The x position of each sprite in the sprite sheet.
    const spriteX = <double>[192, 0, 96, 288];

    for (var direction in DirectionEnum.values) {
      animations[direction] = await SpriteAnimation.load(
          path,
          SpriteAnimationData.sequenced(
              amount: 3,
              textureSize: Vector2(32, 32),
              stepTime: 0.1,
              texturePosition: Vector2(spriteX[direction.index], 0)));
    }

    return PlayerComponent._(animations, start);
  }

  void moveInDirection(RawKeyEvent event) {
    if (event is RawKeyDownEvent) {
      current = Input.directionFrom(event);
      // add(MoveCharacterEffect(
      //   path: [current.vector],
      //   speed: 200.0,
      //   startingDirection: current ?? DirectionEnum.down,
      //   onDirectionChange: (direction) => current = direction,
      // ));
    }
  }

  // void moveOnPath({required double speed, required List<Vector2> points}) {
  //   if (_moveEffect != null) remove(_moveEffect!);

  //   _moveEffect = MoveCharacterEffect(
  //     path: points.toList(),
  //     speed: speed,
  //     startingDirection: current ?? DirectionEnum.down,
  //     onDirectionChange: (direction) => current = direction,
  //   );

  //   add(_moveEffect!);
  // }

  @override
  void update(double dt) => super.update(dt);

  @override
  void render(Canvas canvas) => super.render(canvas);
}
