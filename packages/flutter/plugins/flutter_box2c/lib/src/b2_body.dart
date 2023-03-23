part of b2;

/// Make a body definition with default values.
/// Adapted from `box2c/types.h`
class FFIBody implements Body {
  FFIBody._(this._bodyId);

  final b2BodyId _bodyId;

  @override
  Point get position {
    final b2v2 = globalBindings.b2Body_GetPosition(_bodyId);
    return Point(b2v2.x, b2v2.y);
  }
}
