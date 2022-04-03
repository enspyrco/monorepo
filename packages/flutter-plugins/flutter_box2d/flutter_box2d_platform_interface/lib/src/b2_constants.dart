/// enum defined in b2_shape.h as b2Shape::Type
/// not sure how to deal with an enum inside a class so we use an int for the bindings
///
///
/// A shape is used for collision detection. You can create a shape however you like.
/// Shapes used for simulation in b2World are created automatically when a b2Fixture
/// is created. Shapes may encapsulate a one or more child shapes.
abstract class b2ShapeType {
  static const int e_circle = 0;
  static const int e_edge = 1;
  static const int e_polygon = 2;
  static const int e_chain = 3;
  static const int e_typeCount = 4;
}

/// enum defined in b2_body.h - ffigen produced the following
///
/// The body type.
/// static: zero mass, zero velocity, may be manually moved
/// kinematic: zero mass, non-zero velocity set by user, moved by solver
/// dynamic: positive mass, non-zero velocity determined by forces, moved by solver
abstract class b2BodyType {
  static const int b2_staticBody = 0;
  static const int b2_kinematicBody = 1;
  static const int b2_dynamicBody = 2;
}
