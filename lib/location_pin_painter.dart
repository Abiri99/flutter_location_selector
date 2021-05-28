import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LocationPinPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Color(0xff582D81)
      ..style = PaintingStyle.fill;

    _drawPinShadow(canvas, size);
  }

  _drawPinShadow(Canvas canvas, Size size) {
    Paint paint = Paint()
        ..color = Colors.black.withOpacity(0.0)
        ..style = PaintingStyle.fill
        ..imageFilter = ImageFilter.blur(sigmaX: 0.8, sigmaY: 0.8);

    Rect rect = Rect.fromCenter(center: Offset(size.width / 2, size.height / 2), width: 16, height: 6);

    canvas.drawOval(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) =>
      this != oldDelegate;
}
