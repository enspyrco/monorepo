import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract class B2Vec2Platform extends PlatformInterface {

	static final Object _token = Object();

	B2Vec2Platform() : super(token: _token);

	B2Vec2Platform.from2(x, y) : super(token: _token);

	void setZero();

	void set(double x, double y);

	void op_add(covariant B2Vec2Platform v);

	void op_sub(covariant B2Vec2Platform v);

	void op_mul(double s);

	double length();

	double lengthSquared();

	double normalize();

	bool isValid();

	B2Vec2Platform skew();

	void set x(double arg0);

	void set y(double arg0);

	void dispose();

}
