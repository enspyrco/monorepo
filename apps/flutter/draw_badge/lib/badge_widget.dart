import 'package:flutter/material.dart';

import 'dart_logo_painter.dart';

class BadgeWidget extends StatelessWidget {
  BadgeWidget(this.percentNum, this.projectType, {Key? key}) : super(key: key) {
    percentColor = percentNum < 50
        ? Colors.red[400]!
        : percentNum < 80
            ? Colors.amber[700]!
            : Colors.green[500]!;
    projectColor =
        projectType == 'dart' ? Colors.blue[200]! : Colors.blue[600]!;
  }

  final int percentNum;
  final String projectType;
  late final Color percentColor;
  late final Color projectColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BadgeBackground(percentColor),
        ClipRect(
          clipper: RightClipper(percentNum),
          child: BadgeBackground(projectColor),
        ),
        if (projectType == 'flutter') const PositionedFlutterLogo(),
        if (projectType == 'dart') const PositionedDartLogo(),
        PositionedText(percentNum),
      ],
    );
  }
}

class RightClipper extends CustomClipper<Rect> {
  RightClipper(this.percentNum);

  final int percentNum;

  @override
  Rect getClip(Size size) => Rect.fromPoints(
      const Offset(0, 0), Offset(size.width * percentNum / 100, size.height));

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) => true;
}

class PositionedText extends StatelessWidget {
  const PositionedText(this.percentNum, {Key? key}) : super(key: key);

  final int percentNum;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 25,
      left: 85,
      child: SizedBox(
        width: 260,
        height: 60,
        child: Text(
          'coverage  $percentNum%',
          style: TextStyle(
              color: Colors.grey[100]!,
              fontSize: 35,
              backgroundColor: Colors.transparent),
        ),
      ),
    );
  }
}

class PositionedFlutterLogo extends StatelessWidget {
  const PositionedFlutterLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 20,
      left: 15,
      child: Container(
        width: 60,
        height: 60,
        decoration: const FlutterLogoDecoration(),
      ),
    );
  }
}

class PositionedDartLogo extends StatelessWidget {
  const PositionedDartLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 20,
      left: 15,
      child: CustomPaint(
        size: const Size(60, 60),
        painter: DartLogoPainter(),
      ),
    );
  }
}

class BadgeBackground extends StatelessWidget {
  const BadgeBackground(this.fillColor, {Key? key}) : super(key: key);

  final Color fillColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340,
      height: 100,
      decoration: BoxDecoration(
          color: fillColor,
          border: Border.all(
            color: Colors.grey[500]!,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(20))),
    );
  }
}
