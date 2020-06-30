import 'package:adventures_in/middleware/app_middleware.dart';
import 'package:adventures_in/models/app/app_state.dart';
import 'package:adventures_in/reducers/app_reducer.dart';
import 'package:adventures_in/services/auth_service.dart';
import 'package:adventures_in/widgets/adventures_in_app.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

void main() {
  /// Create services
  final authService = AuthService();

  /// Create the redux store
  final store = Store<AppState>(appReducer,
      initialState: AppState.init(),
      middleware: [...createAppMiddleware(authService: authService)]);

  runApp(AdventuresInApp(store));
}
