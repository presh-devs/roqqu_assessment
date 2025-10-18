import 'dart:math';
import 'package:flutter/material.dart';

class SparklinePainter extends CustomPainter {
  final List<double> data;
  SparklinePainter({required this.data});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF00C076)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    if (data.length < 2) return;

    final path = Path();
    final double stepX = size.width / (data.length - 1);
    final double minY = data.reduce(min);
    final double maxY = data.reduce(max);
    final double range = (maxY - minY).abs() < 0.01 ? 1.0 : (maxY - minY);

    double getX(int i) => i * stepX;
    double getY(int i) => size.height - ((data[i] - minY) / range * size.height);

    path.moveTo(getX(0), getY(0));
    for (int i = 1; i < data.length; i++) {
      path.lineTo(getX(i), getY(i));
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
