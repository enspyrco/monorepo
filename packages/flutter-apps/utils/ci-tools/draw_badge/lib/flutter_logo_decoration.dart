import 'dart:typed_data';
import 'dart:ui' as ui show Gradient;

import 'package:flutter/material.dart';

/// An immutable description of how to paint Flutter's logo.
class FlutterLogoDecoration extends Decoration {
  /// Creates a decoration that knows how to paint Flutter's logo.
  const FlutterLogoDecoration(
      {this.margin = EdgeInsets.zero, this.opacity = 1.0});

  /// How far to inset the logo from the edge of the container.
  final EdgeInsets margin;
  final double opacity;

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) =>
      _FlutterLogoPainter(this);
}

/// An object that paints a [BoxDecoration] into a canvas.
class _FlutterLogoPainter extends BoxPainter {
  _FlutterLogoPainter(this._config) : super(null);

  final FlutterLogoDecoration _config;

  // This class contains a lot of magic numbers. They were derived from the
  // values in the SVG files exported from the original artwork source.

  void _paintLogo(Canvas canvas, Rect rect) {
    // Our points are in a coordinate space that's 166 pixels wide and 202 pixels high.
    // First, transform the rectangle so that our coordinate space is a square 202 pixels
    // to a side, with the top left at the origin.
    canvas.save();
    canvas.translate(rect.left, rect.top);
    canvas.scale(rect.width / 202.0, rect.height / 202.0);
    // Next, offset it some more so that the 166 horizontal pixels are centered
    // in that square (as opposed to being on the left side of it). This means
    // that if we draw in the rectangle from 0,0 to 166,202, we are drawing in
    // the center of the given rect.
    canvas.translate((202.0 - 166.0) / 2.0, 0.0);

    // Set up the styles.
    final Paint lightPaint = Paint()..color = const Color(0xFF54C5F8);
    final Paint mediumPaint = Paint()..color = const Color(0xFF29B6F6);
    final Paint darkPaint = Paint()..color = const Color(0xFF01579B);

    final ui.Gradient triangleGradient = ui.Gradient.linear(
      const Offset(87.2623 + 37.9092, 28.8384 + 123.4389),
      const Offset(42.9205 + 37.9092, 35.0952 + 123.4389),
      <Color>[
        const Color(0x001A237E),
        const Color(0x661A237E),
      ],
    );
    final Paint trianglePaint = Paint()..shader = triangleGradient;

    // Draw the basic shape.
    final Path topBeam = Path()
      ..moveTo(37.7, 128.9)
      ..lineTo(9.8, 101.0)
      ..lineTo(100.4, 10.4)
      ..lineTo(156.2, 10.4);
    canvas.drawPath(topBeam, lightPaint);

    final Path middleBeam = Path()
      ..moveTo(156.2, 94.0)
      ..lineTo(100.4, 94.0)
      ..lineTo(78.5, 115.9)
      ..lineTo(106.4, 143.8);
    canvas.drawPath(middleBeam, lightPaint);

    final Path bottomBeam = Path()
      ..moveTo(79.5, 170.7)
      ..lineTo(100.4, 191.6)
      ..lineTo(156.2, 191.6)
      ..lineTo(107.4, 142.8);
    canvas.drawPath(bottomBeam, darkPaint);

    // The overlap between middle and bottom beam.
    canvas.save();
    canvas.transform(Float64List.fromList(const <double>[
      // careful, this is in _column_-major order
      0.7071, -0.7071, 0.0, 0.0,
      0.7071, 0.7071, 0.0, 0.0,
      0.0, 0.0, 1.0, 0.0,
      -77.697, 98.057, 0.0, 1.0,
    ]));
    canvas.drawRect(const Rect.fromLTWH(59.8, 123.1, 39.4, 39.4), mediumPaint);
    canvas.restore();

    // The gradients below the middle beam on top of the bottom beam.
    final Path triangle = Path()
      ..moveTo(79.5, 170.7)
      ..lineTo(120.9, 156.4)
      ..lineTo(107.4, 142.8);
    canvas.drawPath(triangle, trianglePaint);

    canvas.restore();
  }

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    offset += _config.margin.topLeft;
    final Size canvasSize = _config.margin.deflateSize(configuration.size!);
    if (canvasSize.isEmpty) {
      return;
    }
    final Size logoSize;

    // only the mark
    logoSize = const Size(202.0, 202.0);

    final FittedSizes fittedSize =
        applyBoxFit(BoxFit.contain, logoSize, canvasSize);
    assert(fittedSize.source == logoSize);
    final double centerSquareHeight = canvasSize.shortestSide;
    final Rect centerSquare = Rect.fromLTWH(
      offset.dx + (canvasSize.width - centerSquareHeight) / 2.0,
      offset.dy + (canvasSize.height - centerSquareHeight) / 2.0,
      centerSquareHeight,
      centerSquareHeight,
    );

    final Rect logoTargetSquare = centerSquare;

    final Rect logoSquare = Rect.lerp(centerSquare, logoTargetSquare, 0.0)!;

    if (_config.opacity < 1.0) {
      canvas.saveLayer(
        offset & canvasSize,
        Paint()
          ..colorFilter = ColorFilter.mode(
            const Color(0xFFFFFFFF).withOpacity(_config.opacity),
            BlendMode.modulate,
          ),
      );
    }

    _paintLogo(canvas, logoSquare);

    if (_config.opacity < 1.0) {
      canvas.restore();
    }
  }
}
