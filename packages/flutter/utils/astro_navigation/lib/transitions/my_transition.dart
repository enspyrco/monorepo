import 'package:flutter/material.dart';

class MyTransition extends StatelessWidget {
  const MyTransition({required this.animation, required this.child, super.key});

  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    final tween = Tween(begin: const Offset(0.0, 1.0), end: Offset.zero);
    final curveTween = CurveTween(curve: Curves.easeInOut);
    return SlideTransition(
      position: animation.drive(curveTween).drive(tween),
      child: child,
    );
  }
}
