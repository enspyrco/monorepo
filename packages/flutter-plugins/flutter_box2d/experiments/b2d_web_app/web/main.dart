// @JS()
// class b2World {
//   external b2World(double gravity);
//   external CreateBody(Object def);
//   external DestroyBody(Object body);
// }

import 'package:js/js.dart';

@JS('b2World')
@staticInterop
class B2World {
  @JS('b2World')
  external B2World(double gravity);
}

extension B2BodyExtension on B2World {
  external CreateBody(Object def);
  external DestroyBody(Object body);
}

@JS('b2Vec2')
@staticInterop
class B2Vec2JSImpl {
  @JS('b2Vec2')
  external B2Vec2JSImpl();
  @JS('b2Vec2')
  external B2Vec2JSImpl.from2(double x, double y);
}

extension B2Vec2JSImplExtension on B2Vec2JSImpl {
  external SetZero();
}

void main() {
  // var world = B2World(12);
  // print(world.CreateBody('def'));
  // print(world.DestroyBody('obj'));
  var vec0 = B2Vec2JSImpl();
  var vec = B2Vec2JSImpl.from2(0, 10);
}
