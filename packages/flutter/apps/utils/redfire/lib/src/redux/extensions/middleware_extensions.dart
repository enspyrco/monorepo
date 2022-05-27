import 'package:redux/redux.dart';

extension MiddlewaresExtension on List<Middleware> {
  List<Middleware> combineWith(List<Middleware> middlewares) =>
      [...this, ...List<Middleware>.from(middlewares)];
}
