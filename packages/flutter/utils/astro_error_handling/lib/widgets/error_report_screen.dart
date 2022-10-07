import 'package:astro_state_interface/astro_state_interface.dart';
import 'package:flutter/material.dart';

import '../astro_error_handling.dart';

/// The [ErrorReportView] is used for alerting a user when an error was thrown.
class ErrorReportScreen<T extends AstroState> extends StatelessWidget {
  const ErrorReportScreen(this.report, {Key? key}) : super(key: key);

  final ErrorReport report;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Whoops'),
      content: SingleChildScrollView(child: Text(report.message)),
      actions: const [
        OutlinedButton(
            onPressed:
                null, // () => MissionControlProvider.of<T>(this).land(RemoveErrorReport(report)),
            child: Text('Dismiss'))
      ],
    );
  }
}
