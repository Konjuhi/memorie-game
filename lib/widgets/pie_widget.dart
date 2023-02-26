import 'dart:math';

import 'package:flutter/material.dart';

class PieWidget extends CustomPainter {
  final double startAngle;
  final double endAngle;
  final bool clockwise;

  PieWidget(
      {required this.startAngle,
      required this.endAngle,
      this.clockwise = false});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width, size.height) / 2;

    final start = Offset(
      center.dx + radius * cos(startAngle),
      center.dy + radius * sin(startAngle),
    );

    final path = Path()
      ..moveTo(center.dx, center.dy)
      ..lineTo(start.dx, start.dy)
      ..arcTo(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        endAngle - startAngle,
        clockwise,
      )
      ..lineTo(center.dx, center.dy);

    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.red.withOpacity(0.5);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(PieWidget oldDelegate) =>
      startAngle != oldDelegate.startAngle ||
      endAngle != oldDelegate.endAngle ||
      clockwise != oldDelegate.clockwise;
}
