import 'package:flutter/material.dart';

class BasicTweenSlideTransition extends StatelessWidget {
  const BasicTweenSlideTransition(
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
