import 'package:astro_locator/astro_locator.dart';
import 'package:astro_types/core_types.dart';
import 'package:astro_types/state_types.dart';
import 'package:flutter/material.dart';

import '../../missions/remove_error_report.dart';
import '../../state/models/error_report.dart';

/// The [ErrorReportView] is used for alerting a user when an error was thrown.
class ErrorReportScreen<T extends AstroState> extends StatelessWidget {
  const ErrorReportScreen(this.report, {Key? key}) : super(key: key);

  final DefaultErrorReport report;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Whoops'),
      content: SingleChildScrollView(child: Text(report.message)),
      actions: [
        OutlinedButton(
            onPressed: () =>
                locate<MissionControl<T>>().land(RemoveErrorReport(report)),
            child: const Text('Dismiss'))
      ],
    );
  }
}
