@JS()
library box2d;

import 'package:js/js.dart';

import 'b2_delegates.dart';

class B2Vec2JSAdapter implements B2Vec2Platform {

	B2Vec2JSAdapter._(B2Vec2JSImpl impl) : _impl = impl;

	final B2Vec2JSImpl _impl;

	B2Vec2JSAdapter() : _impl = B2Vec2JSImpl();

	B2Vec2JSAdapter.from2(double x, double y) : _impl = B2Vec2JSImpl.from2(x, y);

	void setZero() => _impl.setZero();

	void set(double x, double y) => _impl.set(x, y);

	void op_add(B2Vec2JSAdapter v) => _impl.op_add(v._impl);

	void op_sub(B2Vec2JSAdapter v) => _impl.op_sub(v._impl);

	void op_mul(double s) => _impl.op_mul(s);

	double length() => _impl.length().toDouble();

	double lengthSquared() => _impl.lengthSquared().toDouble();

	double normalize() => _impl.normalize().toDouble();

	bool isValid() => _impl.isValid();

	B2Vec2JSAdapter skew() => B2Vec2JSAdapter._(_impl.skew());

	void set x(double arg0) => _impl.set_x(arg0);

	void set y(double arg0) => _impl.set_y(arg0);

	void dispose() => _impl.__destroy__();

}
@JS('b2Vec2')
class B2Vec2JSImpl {
	external B2Vec2JSImpl();
	external B2Vec2JSImpl.from2(num x, num y);

	external void setZero();

	external void set(num x, num y);

	external void op_add(B2Vec2JSImpl v);

	external void op_sub(B2Vec2JSImpl v);

	external void op_mul(num s);

	external double length();

	external double lengthSquared();

	external double normalize();

	external bool isValid();

	external B2Vec2JSImpl skew();

	external void set_x(num arg0);

	external void set_y(num arg0);

	external void __destroy__();

}
