part of b2;

/// Make a body definition with default values.
/// Adapted from `box2c/types.h`
class FFIBody implements Body {
  FFIBody._(this._bodyId);

  final b2BodyId _bodyId;

  @override
  Shape createBoxShape({
    required double width,
    required double height,
    double friction = 0.6,
    double restitution = 0.0,
    double density = 0.0,
    bool isSensor = false,
  }) {
    // Add the box shape to the ground body.
    Pointer<b2ShapeDef> defPtr = calloc<b2ShapeDef>();
    defPtr.ref.friction = friction;
    defPtr.ref.restitution = restitution;
    defPtr.ref.density = density;
    defPtr.ref.filter = globalBindings.b2_defaultFilter;
    defPtr.ref.isSensor = isSensor;

    /// Define the box shape. The extents are the half-widths of the box.
    /// Calling [b2MakeBox] results in a [b2Polygon] in Dart memory so we
    /// need to create the equivalent C memory before passing to [b2Body_CreatePolygon].
    b2Polygon box = globalBindings.b2MakeBox(width / 2, height / 2);
    Pointer<b2Polygon> boxPtr = malloc<b2Polygon>();
    boxPtr.ref.centroid = box.centroid;
    boxPtr.ref.count = box.count;
    boxPtr.ref.normals = box.normals;
    boxPtr.ref.vertices = box.vertices;

    b2ShapeId shapeId =
        globalBindings.b2Body_CreatePolygon(_bodyId, defPtr, boxPtr);

    calloc.free(defPtr);
    calloc.free(boxPtr);

    return FFIShape._(shapeId);
  }

  @override
  Point get position {
    final b2v2 = globalBindings.b2Body_GetPosition(_bodyId);
    return Point(b2v2.x, b2v2.y);
  }

  @override
  double get angle => globalBindings.b2Body_GetAngle(_bodyId);
}
