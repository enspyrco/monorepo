import 'package:flutter/material.dart';

import 'account_button.dart';
import 'role_selector.dart';
import 'sessions_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
          children: const [RoleSelector(), SessionsView(), AccountButton()]),
    );
  }
}
