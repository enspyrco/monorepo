import 'package:flutter/material.dart';

/// A widget used in tests to check that the [AppWidget.mainPage] appears in
/// the widget tree, as expected.
class EmptyMainPage extends StatelessWidget {
  const EmptyMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
