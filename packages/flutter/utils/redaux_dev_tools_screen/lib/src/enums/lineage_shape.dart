import 'package:flutter/material.dart';

enum LineageShape {
  origin([OriginShape()]),
  connection([ConnectionShape()]),
  notConnection([NotConnectedShapeTop(), NotConnectedShapeBottom()]),
  endpoint([EndpointShapeTop(), EndpointShapeBottom()]);

  const LineageShape(this.shapeWidgets);

  final List<Widget> shapeWidgets;
}

class OriginShape extends StatelessWidget {
  const OriginShape({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        right: 30,
        top: 40,
        child: Container(
          width: 20,
          height: 80,
          color: Colors.green,
        ));
  }
}

class NotConnectedShapeTop extends StatelessWidget {
  const NotConnectedShapeTop({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 30,
      child: Container(
        width: 20,
        height: 5,
        color: Colors.green,
      ),
    );
  }
}

class NotConnectedShapeBottom extends StatelessWidget {
  const NotConnectedShapeBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 30,
      bottom: 0,
      child: Container(
        width: 20,
        height: 5,
        color: Colors.green,
      ),
    );
  }
}

class ConnectionShape extends StatelessWidget {
  const ConnectionShape({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 30,
      child: Container(
        width: 20,
        height: 80,
        color: Colors.green,
      ),
    );
  }
}

class EndpointShapeTop extends StatelessWidget {
  const EndpointShapeTop({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 30,
      child: Container(
        width: 20,
        height: 10,
        color: Colors.green,
      ),
    );
  }
}

class EndpointShapeBottom extends StatelessWidget {
  const EndpointShapeBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        right: 15,
        top: 10,
        child: ClipPath(
          clipper: CustomTriangleClipper(),
          child: Container(
            width: 50,
            height: 50,
            color: Colors.green,
          ),
        ));
  }
}

class CustomTriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width / 2, size.height / 2);
    path.lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
