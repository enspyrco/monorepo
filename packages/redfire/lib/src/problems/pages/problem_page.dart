import 'package:flutter/material.dart';
import 'package:redfire/src/problems/models/problem_info.dart';
import 'package:redfire/src/problems/widgets/problem_info_view.dart';

import '../../../types.dart';

/// Creates a widget to show an error from a type of [ProblemInfo].
/// The [ProblemPage] is used for alerting a user to an error.
class ProblemPage<T extends RedFireState> extends Page<dynamic> {
  final ProblemInfo info;

  ProblemPage({
    required this.info,
  }) : super(key: ValueKey(info));

  // const ProblemPage(this.info, {Key? key}) : super(key: key);

  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder<dynamic>(
      settings: this,
      pageBuilder: (context, animation, animation2) {
        final tween = Tween(begin: const Offset(0.0, 1.0), end: Offset.zero);
        final curveTween = CurveTween(curve: Curves.easeInOut);
        return SlideTransition(
          position: animation.drive(curveTween).drive(tween),
          child: ProblemInfoView<T>(
            info,
            key: ValueKey(info),
          ),
        );
      },
    );
  }
}
