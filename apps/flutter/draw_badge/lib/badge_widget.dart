import 'package:flutter/material.dart';

import 'dart_logo_painter.dart';

class BadgeWidget extends StatelessWidget {
  const BadgeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRect(
          clipper: LeftClipper(),
          child: BadgeBackground(Colors.red[400]!),
        ),
        ClipRect(
          clipper: RightClipper(),
          child: BadgeBackground(Colors.blue[200]!),
        ),
        const PositionedFlutterLogo(),
        // const PositionedDartLogo(),
        const PositionedText(),
      ],
    );
  }
}

class RightClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) =>
      Rect.fromPoints(const Offset(0, 0), Offset(240, size.height));

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) => true;
}

class LeftClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) =>
      Rect.fromPoints(const Offset(240, 0), Offset(size.width, size.height));

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) => true;
}

class PositionedText extends StatelessWidget {
  const PositionedText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 30,
      left: 80,
      child: SizedBox(
        width: 260,
        height: 60,
        child: Text(
          'coverage  20%',
          style: TextStyle(
              color: Colors.grey[800]!,
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
