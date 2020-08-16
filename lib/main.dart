import 'package:flireator/utils/redux_bundle.dart';
import 'package:flireator/utils/services_bundle.dart';
import 'package:flireator/widgets/app.dart';
import 'package:flutter/material.dart';

void main() {
  /// The [Firestore] plugin requires binding is initialized.
  WidgetsFlutterBinding.ensureInitialized();

  /// A [GlobalKey], shared between the [NavigationService] and [MaterialApp]
  /// widget, allows the service to perform navigation with a [BuildContext]
  final navKey = GlobalKey<NavigatorState>();

  /// All the app services bundled together
  final services = ServicesBundle(navKey: navKey);

  // Create the redux bundle (services, middleware, store)
  final redux = ReduxBundle(services);

  runApp(FlireatorApp(redux.store, navKey));
}
