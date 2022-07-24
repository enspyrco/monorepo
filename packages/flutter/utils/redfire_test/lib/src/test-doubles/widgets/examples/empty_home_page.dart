import 'package:flutter/material.dart';

/// A widget used in tests to check that the [AppWidget.homePage] appears in
/// the widget tree, as expected.
class EmptyHomePage extends StatelessWidget {
  const EmptyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
