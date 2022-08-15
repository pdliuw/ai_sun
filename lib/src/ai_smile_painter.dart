import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

///
/// AiSmilePainter
class AiSmilePainter extends CustomPainter {
  final Color color;

  ///
  /// defaultStyle
  AiSmilePainter({
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final radius = math.min(size.width, size.height) / 2;
    final smileRadius = (radius / 8).toDouble();
    final smileWidth = smileRadius;
    final center =
        Offset(size.width.toDouble() / 2, size.height.toDouble() / 2);
    // Draw the body
    final paint = Paint()..color = color;
    canvas.drawCircle(center, radius, paint);
    // Draw the mouth
    final smilePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..strokeWidth = smileWidth;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius / 2),
      0,
      math.pi,
      false,
      smilePaint,
    );
    // Draw the eyes
    canvas.drawCircle(
      Offset(
          center.dx.toDouble() - radius / 2, center.dy.toDouble() - radius / 2),
      smileRadius,
      Paint(),
    );
    canvas.drawCircle(
      Offset(
          center.dx.toDouble() + radius / 2, center.dy.toDouble() - radius / 2),
      smileRadius,
      Paint(),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
