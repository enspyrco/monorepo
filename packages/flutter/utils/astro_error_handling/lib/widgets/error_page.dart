import 'package:astro_state_interface/astro_state_interface.dart';
import 'package:flutter/material.dart';

import '../astro_error_handling.dart';
import 'error_report_screen.dart';

/// An [ErrorReportPage] is created from an [ErrorMessagePagePrecursor] which
/// is kept in [AppState.navigation.stack], and passed in to the [Navigator]
/// when AppState's navigation stack changes.
class ErrorReportPage<T extends AstroState> extends Page<dynamic> {
  ErrorReportPage({required this.report}) : super(key: ValueKey(report));

  final ErrorReport report;

  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder<dynamic>(
      settings: this,
      pageBuilder: (context, animation, animation2) {
        final tween = Tween(begin: const Offset(0.0, 1.0), end: Offset.zero);
        final curveTween = CurveTween(curve: Curves.easeInOut);
        return SlideTransition(
          position: animation.drive(curveTween).drive(tween),
          child: ErrorReportScreen<T>(report, key: ValueKey(report)),
        );
      },
    );
  }
}
