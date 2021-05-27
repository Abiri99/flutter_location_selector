import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class WorldMapPainter extends CustomPainter {
  final bool developMode;

  final double translationX;

  WorldMapPainter({
    this.developMode = false,
    this.translationX,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (!developMode)
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
    canvas.translate(translationX ?? 0, 0);

    if (!developMode) _drawAmericaContinentShadow(canvas);
    _drawAmericaContinent(canvas);
    _drawAsiaContinent(canvas);
    _drawMediterraneanSea(canvas);
    _drawRedSea(canvas);
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

  void _drawRedSea(Canvas canvas) {
    Path path = Path();

    path.moveTo(218, 106);

    Paint paint = Paint()
      ..color = Color(0xff68B0E0)
      ..strokeWidth = 3.0
      ..strokeJoin = StrokeJoin.round
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;

    canvas.drawCircle(Offset(218, 106), 2, paint);
    path.close();

    canvas.drawPath(path, paint);
  }

  void _drawMediterraneanSea(Canvas canvas) {
    Path path = Path();

    path.moveTo(208, 101);

    Paint paint = Paint()
      ..color = Color(0xff68B0E0)
      ..strokeWidth = 3.0
      ..strokeJoin = StrokeJoin.round
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;

    // canvas.drawCircle(Offset(208, 101), 2, paint);
    cubicTo(canvas, path, 215, 103, 240, 97, 210, 94, drawCircles: false);
    cubicTo(canvas, path, 200, 96, 198, 83, 185, 93, drawCircles: false);
    cubicTo(canvas, path, 170, 106, 196, 90, 198, 102, drawCircles: false);
    cubicTo(canvas, path, 200, 105, 204, 104, 208, 101, drawCircles: false);
    path.close();

    canvas.drawPath(path, paint);
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
    cubicTo(canvas, path, 182, 70, 200, 79, 203, 73, drawCircles: false);
    cubicTo(canvas, path, 209, 65, 195, 72, 194, 68, drawCircles: false);
    cubicTo(canvas, path, 192, 65, 200, 55, 210, 58, drawCircles: false);
    cubicTo(canvas, path, 230, 62, 240, 58, 250, 55, drawCircles: false);
    cubicTo(canvas, path, 270, 40, 280, 60, 300, 53, drawCircles: false);
    cubicTo(canvas, path, 310, 50, 322, 60, 330, 58, drawCircles: false);
    cubicTo(canvas, path, 335, 58, 345, 59, 349, 67, drawCircles: false);
    cubicTo(canvas, path, 345, 73, 335, 65, 325, 67, drawCircles: false);
    cubicTo(canvas, path, 308, 70, 330, 75, 320, 82, drawCircles: false);
    cubicTo(canvas, path, 311, 89, 348, 100, 310, 110, drawCircles: false);
    cubicTo(canvas, path, 293, 115, 312, 120, 305, 125, drawCircles: false);
    cubicTo(canvas, path, 300, 128, 301, 135, 305, 140, drawCircles: false);
    cubicTo(canvas, path, 306, 143, 313, 145, 315, 150, drawCircles: false);
    cubicTo(canvas, path, 305, 152, 300, 145, 295, 141, drawCircles: false);
    cubicTo(canvas, path, 288, 135, 293, 130, 288, 120, drawCircles: false);
    cubicTo(canvas, path, 285, 115, 278, 108, 272, 120, drawCircles: false);
    cubicTo(canvas, path, 270, 135, 260, 135, 260, 115, drawCircles: false);
    cubicTo(canvas, path, 258, 105, 250, 105, 245, 107, drawCircles: false);
    cubicTo(canvas, path, 247, 119, 227, 118, 239, 123, drawCircles: false);
    cubicTo(canvas, path, 249, 131, 224, 138, 230, 152, drawCircles: false);
    cubicTo(canvas, path, 218, 160, 228, 178, 210, 185, drawCircles: false);
    path.close();

    var shiftedPath = path.shift(Offset(translationX, 0));

    Paint paint = Paint()
      ..color = Color(0xffF9AF66)
      ..strokeWidth = 3.0
      ..strokeJoin = StrokeJoin.round
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke;

    canvas.drawPath(shiftedPath, paint);
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

    var shiftedPath = path.shift(Offset(translationX, 0));

    Paint paint = Paint()
      // ..color = Colors.green
      ..color = Color(0xffF9AF66)
      // ..color = Colors.brown
      ..strokeWidth = 3.0
      ..strokeJoin = StrokeJoin.round
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;

    canvas.drawPath(shiftedPath, paint);
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

    var shiftedPath = path.shift(Offset(translationX, 0));

    Paint paint = Paint()
      ..color = Colors.black26
      ..imageFilter = ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0)
      // ..color = Colors.brown
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;

    canvas.drawPath(shiftedPath, paint);
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
