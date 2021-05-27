import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class WorldMapPainter extends CustomPainter {
  final bool developMode;

  WorldMapPainter({this.developMode = false});

  @override
  void paint(Canvas canvas, Size size) {
    canvas.clipRRect(
      RRect.fromRectAndRadius(
        Rect.fromCircle(
          center: Offset(size.width / 2, size.height / 2),
          radius: size.height / 2,
        ),
        Radius.circular(10000),
      ),
    );
    if (!developMode) _drawBackgroundColor(canvas, size);

    // canvas.drawColor(Colors.blue, BlendMode.src);
    canvas.translate(0, 0);

    if (!developMode) _drawAmericaContinentShadow(canvas);
    _drawAmericaContinent(canvas);
    _drawAsiaContinent(canvas);
  }

  void _drawBackgroundColor(Canvas canvas, Size size) {
    Path path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    Paint painter = Paint()
      ..shader = ui.Gradient.radial(
        Offset(4 * size.width / 5, 3 * size.height / 4),
        300,
        [
          // Color(0xff003d60),
          // Color(0xff08ab7),
          // Color(0xff009eb5),
          // Color(0xff00aa99),
          // Color(0xff009081),

          Color(0xff3394CC),
          Color(0xff68B0E0),
          // Color(0xff8CC1E6),
        ],
        [
          // 0.3,
          0.3,
          // 0.4,
          // 0.9,
          // 0.8,
          1.0,
        ],
      );
    // ..blendMode = BlendMode.multiply;

    canvas.drawPath(path, painter);
  }

  void _drawAsiaContinent(Canvas canvas) {
    Path path = Path();

    // cubicTo(canvas, path, x1, y1, x2, y2, x3, y3)

    // canvas.drawCircle(Offset(210, 185), 2, paint);
    path.moveTo(210, 185);
    cubicTo(canvas, path, 200, 187, 210, 175, 202, 170, drawCircles: false);
    cubicTo(canvas, path, 195, 165, 205, 160, 198, 152, drawCircles: false);
    cubicTo(canvas, path, 190, 148, 208, 125, 175, 135, drawCircles: false);
    cubicTo(canvas, path, 152, 130, 163, 115, 172, 105, drawCircles: false);
    cubicTo(canvas, path, 180, 100, 170, 90, 181, 87, drawCircles: false);
    cubicTo(canvas, path, 190, 80, 172, 81, 180, 74, drawCircles: false);
    cubicTo(canvas, path, 182, 70, 200, 80, 203, 74, drawCircles: false);

    Paint paint = Paint()
      ..color = Color(0xffF9AF66)
      ..strokeWidth = 3.0
      ..strokeJoin = StrokeJoin.round
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke;

    canvas.drawPath(path, paint);
  }

  void _drawAmericaContinent(Canvas canvas) {
    Path path = Path();
    // draw America
    path.moveTo(60, 60);
    path.quadraticBezierTo(42, 60, 38, 72);
    path.quadraticBezierTo(40, 80, 50, 73);
    path.quadraticBezierTo(73, 62, 62, 90);
    path.quadraticBezierTo(60, 90, 65, 100);
    path.quadraticBezierTo(68, 105, 69, 115);
    path.quadraticBezierTo(70, 122, 80, 122);
    path.quadraticBezierTo(85, 122, 89, 132);
    path.quadraticBezierTo(92, 138, 98, 138);
    path.quadraticBezierTo(100, 142, 97, 148);
    path.quadraticBezierTo(95, 156, 102, 160);
    path.quadraticBezierTo(95, 156, 102, 160);
    path.cubicTo(118, 170, 100, 190, 122, 210);
    path.cubicTo(115, 200, 130, 190, 129, 185);
    path.cubicTo(127, 183, 158, 150, 137, 148);
    path.cubicTo(125, 148, 120, 122, 102, 130);
    path.cubicTo(85, 132, 98, 125, 91, 118);
    path.cubicTo(91, 110, 98, 118, 101, 103);
    path.cubicTo(102, 94, 120, 89, 118, 89);
    path.cubicTo(152, 82, 124, 80, 132, 68);
    path.cubicTo(133, 66, 128, 64, 132, 58);
    path.cubicTo(148, 52, 135, 70, 145, 70);
    cubicTo(canvas, path, 148, 72, 158, 59, 172, 55, drawCircles: false);
    cubicTo(canvas, path, 180, 34, 155, 54, 140, 45, drawCircles: false);
    cubicTo(canvas, path, 130, 40, 125, 58, 110, 51, drawCircles: false);
    cubicTo(canvas, path, 100, 45, 100, 70, 60, 60, drawCircles: false);
    path.close();

    Paint paint = Paint()
      ..color = Color(0xffF9AF66)
      // ..color = Colors.brown
      ..strokeWidth = 3.0
      ..strokeJoin = StrokeJoin.round
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;

    canvas.drawPath(path, paint);
  }

  void _drawAmericaContinentShadow(Canvas canvas) {
    Path path = Path();
    // draw America
    path.moveTo(60, 60);
    path.quadraticBezierTo(42, 60, 38, 72);
    path.quadraticBezierTo(40, 80, 50, 73);
    path.quadraticBezierTo(73, 62, 62, 90);
    path.quadraticBezierTo(60, 90, 65, 100);
    path.quadraticBezierTo(68, 105, 69, 115);
    path.quadraticBezierTo(70, 122, 80, 122);
    path.quadraticBezierTo(85, 122, 89, 132);
    path.quadraticBezierTo(92, 138, 98, 138);
    path.quadraticBezierTo(100, 142, 97, 148);
    path.quadraticBezierTo(95, 156, 102, 160);
    path.quadraticBezierTo(95, 156, 102, 160);
    path.cubicTo(118, 170, 100, 190, 122, 210);
    path.cubicTo(115, 200, 130, 190, 129, 185);
    path.cubicTo(127, 183, 158, 150, 137, 148);
    path.cubicTo(125, 148, 120, 122, 102, 130);
    path.cubicTo(85, 132, 98, 125, 91, 118);
    path.cubicTo(91, 110, 98, 118, 101, 103);
    path.cubicTo(102, 94, 120, 89, 118, 89);
    path.cubicTo(152, 82, 124, 80, 132, 68);
    path.cubicTo(133, 66, 128, 64, 132, 58);
    path.cubicTo(148, 52, 135, 70, 145, 70);
    cubicTo(canvas, path, 148, 72, 158, 59, 172, 55, drawCircles: false);
    cubicTo(canvas, path, 180, 34, 155, 54, 140, 45, drawCircles: false);
    cubicTo(canvas, path, 130, 40, 125, 58, 110, 51, drawCircles: false);
    cubicTo(canvas, path, 100, 45, 100, 70, 60, 60, drawCircles: false);
    path.close();

    Paint paint = Paint()
      ..color = Colors.black26
      ..imageFilter = ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0)
      // ..color = Colors.brown
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;

    canvas.drawPath(path, paint);
  }

  void cubicTo(
    Canvas canvas,
    Path path,
    double x1,
    double y1,
    double x2,
    double y2,
    double x3,
    double y3, {
    bool drawCircles = true,
  }) {
    if (drawCircles) {
      Paint circlePainter = Paint()
        ..style = PaintingStyle.fill
        ..color = Colors.blue;
      canvas.drawCircle(Offset(x1, y1), 3, circlePainter);
      canvas.drawCircle(Offset(x2, y2), 3, circlePainter);
      canvas.drawCircle(Offset(x3, y3), 3, circlePainter);
    }

    path.cubicTo(x1, y1, x2, y2, x3, y3);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) =>
      this != oldDelegate;
}
