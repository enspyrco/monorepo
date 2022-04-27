import 'flutter_box2d_platform_interface.dart';
import 'b2_delegates.dart';

class B2World {

	final B2WorldPlatform _delegate;

	B2World.from1(B2Vec2Platform gravity) : _delegate = FlutterBox2DPlatform.instance.b2World_1(gravity);

}

class B2Vec2 {

	final B2Vec2Platform _delegate;

	B2Vec2() : _delegate = FlutterBox2DPlatform.instance.b2Vec2_0();

	B2Vec2.from2(double x, double y) : _delegate = FlutterBox2DPlatform.instance.b2Vec2_2(x, y);

}

