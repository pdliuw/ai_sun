import 'dart:math' as math;

import 'package:flutter/widgets.dart';

///
/// AiSimpleSunPainter
class AiSimpleSunPainter extends CustomPainter {
  final Color color;

  AiSimpleSunPainter({
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double radius = math.min(size.width, size.height) / 2;
    double shineRadius = radius / 3;
    double sunRadius = radius / 2;

    double shineStrokeWidth = shineRadius / 3 * 2;
    var center =
        Offset((size.width / 2).toDouble(), (size.height / 2).toDouble());

    var shinePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = shineStrokeWidth
      ..color = this.color;

    int shineIndex = 0;
    int shineMax = 8;
    double startAngle = 0;
    double maxAngle = math.pi * 2;
    double singleSweepAngle = maxAngle / (shineMax * 2);
    while (shineIndex < shineMax) {
      canvas.drawArc(
        Rect.fromCircle(
            center: center, radius: radius - (shineStrokeWidth / 2)),
        startAngle,
        singleSweepAngle / 3,
        false,
        shinePaint,
      );

      shineIndex++;
      startAngle += singleSweepAngle * 2;
    }

    var paint = Paint()
      ..color = this.color
      ..style = PaintingStyle.fill;
    // Draw circle
    canvas.drawCircle(
      center,
      sunRadius,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
