import 'package:astro_types/state_types.dart';
import 'package:flutter/material.dart';

import '../../state/models/error_report.dart';
import 'error_report_screen.dart';

/// An [ErrorReportPage] is created from an [ErrorMessagePagePrecursor] which
/// is kept in [AppState.navigation.stack], and passed in to the [Navigator]
/// when AppState's navigation stack changes.
class ErrorReportPage<T extends AstroState> extends MaterialPage {
  const ErrorReportPage(this.report, {super.child = const SizedBox()});

  final DefaultErrorReport report;

  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder(
      settings: this,
      pageBuilder: (context, inAnimation, outAnimation) {
        return EasyTweenSlideTransition(
          animation: inAnimation,
          child: ErrorReportScreen<T>(report),
        );
      },
    );
  }
}

/// Duplicated here rather than import astro_navigation
class EasyTweenSlideTransition extends StatelessWidget {
  const EasyTweenSlideTransition(
      {required this.animation, required this.child, super.key});

  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: animation
          .drive(CurveTween(curve: Curves.easeInOut))
          .drive(Tween(begin: const Offset(0.0, 1.0), end: Offset.zero)),
      child: child,
    );
  }
}
