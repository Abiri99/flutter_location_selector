import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class WorldMapPainter extends CustomPainter {
  final bool developMode;

  final double translationX;

  Size size;

  WorldMapPainter({
    this.developMode = false,
    this.translationX,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // canvas.drawColor(Colors.red, BlendMode.src);

    this.size = size;

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
    if (!developMode) _drawAsiaContinentShadow(canvas);
    _drawAmericaContinent(canvas);
    _drawAsiaContinent(canvas);
    _drawMediterraneanSea(canvas);
    _drawRedSea(canvas);
  }

  double _ccx(double x) {
    var result = x * (size.width / 392.72727272727275);
    // if (result + translationX > size.width) {
    //   var response = size.width - (result + translationX);
    //   print('response: $response');
    //   return response;
    // }
    // if ()
    return result;
  }

  double _ccy(double y) {
    // return y;
    // return y * (size.height / 604.1958041958043);
    return y * (size.height / 255.2727272727273);
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

    var shiftedPath = path.shift(Offset(translationX, 0));

    canvas.drawPath(path, painter);
  }

  void _drawRedSea(Canvas canvas) {
    Path path = Path();

    path.moveTo(_ccx(218), _ccy(106));

    cubicTo(canvas, path, _ccx(225), _ccy(105), _ccx(230), _ccy(108), _ccx(228), _ccy(123), drawCircles: false);
    cubicTo(canvas, path, _ccx(220), _ccy(122), _ccx(228), _ccy(113), _ccx(218), _ccy(106), drawCircles: false);
    path.close();

    Paint paint = Paint()
      ..color = Color(0xff68B0E0)
      ..strokeWidth = 2.0
      ..strokeJoin = StrokeJoin.round
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;

    var shiftedPath = path.shift(Offset(translationX, 0));

    canvas.drawPath(shiftedPath, paint);
  }

  void _drawMediterraneanSea(Canvas canvas) {
    Path path = Path();

    path.moveTo(_ccx(208), _ccy(101));

    Paint paint = Paint()
      ..color = Color(0xff68B0E0)
      ..strokeWidth = 3.0
      ..strokeJoin = StrokeJoin.round
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;

    // canvas.drawCircle(Offset(208, 101), 2, paint);
    cubicTo(canvas, path, _ccx(215), _ccy(103), _ccx(240), _ccy(97), _ccx(210), _ccy(94), drawCircles: false);
    cubicTo(canvas, path, _ccx(200), _ccy(96), _ccx(198), _ccy(83), _ccx(185), _ccy(93), drawCircles: false);
    cubicTo(canvas, path, _ccx(170), _ccy(106), _ccx(196), _ccy(90), _ccx(198), _ccy(102), drawCircles: false);
    cubicTo(canvas, path, _ccx(200), _ccy(105), _ccx(204), _ccy(104), _ccx(208), _ccy(101), drawCircles: false);
    path.close();

    var shiftedPath = path.shift(Offset(translationX, 0));

    canvas.drawPath(shiftedPath, paint);
  }

  void _drawAsiaContinent(Canvas canvas) {
    Path path = Path();
    path.moveTo(_ccx(210), _ccy(185));
    cubicTo(canvas, path, _ccx(200), _ccy(187), _ccx(210), _ccy(175), _ccx(202), _ccy(170), drawCircles: false);
    cubicTo(canvas, path, _ccx(195), _ccy(165), _ccx(205), _ccy(160), _ccx(198), _ccy(152), drawCircles: false);
    cubicTo(canvas, path, _ccx(190), _ccy(148), _ccx(208), _ccy(125), _ccx(175), _ccy(135), drawCircles: false);
    cubicTo(canvas, path, _ccx(152), _ccy(130), _ccx(163), _ccy(115), _ccx(172), _ccy(105), drawCircles: false);
    cubicTo(canvas, path, _ccx(180), _ccy(100), _ccx(170), _ccy(90), _ccx(181), _ccy(87), drawCircles: false);
    cubicTo(canvas, path, _ccx(190), _ccy(80), _ccx(172), _ccy(81), _ccx(180), _ccy(74), drawCircles: false);
    cubicTo(canvas, path, _ccx(182), _ccy(70), _ccx(200), _ccy(79), _ccx(203), _ccy(73), drawCircles: false);
    cubicTo(canvas, path, _ccx(209), _ccy(65), _ccx(195), _ccy(72), _ccx(194), _ccy(68), drawCircles: false);
    cubicTo(canvas, path, _ccx(192), _ccy(65), _ccx(200), _ccy(55), _ccx(210), _ccy(58), drawCircles: false);
    cubicTo(canvas, path, _ccx(230), _ccy(62), _ccx(240), _ccy(58), _ccx(250), _ccy(55), drawCircles: false);
    cubicTo(canvas, path, _ccx(270), _ccy(40), _ccx(280), _ccy(60), _ccx(300), _ccy(53), drawCircles: false);
    cubicTo(canvas, path, _ccx(310), _ccy(50), _ccx(322), _ccy(60), _ccx(330), _ccy(58), drawCircles: false);
    cubicTo(canvas, path, _ccx(335), _ccy(58), _ccx(345), _ccy(59), _ccx(349), _ccy(67), drawCircles: false);
    cubicTo(canvas, path, _ccx(345), _ccy(73), _ccx(335), _ccy(65), _ccx(325), _ccy(67), drawCircles: false);
    cubicTo(canvas, path, _ccx(308), _ccy(70), _ccx(330), _ccy(75), _ccx(320), _ccy(82), drawCircles: false);
    cubicTo(canvas, path, _ccx(311), _ccy(89), _ccx(348), _ccy(100), _ccx(310), _ccy(110), drawCircles: false);
    cubicTo(canvas, path, _ccx(293), _ccy(115), _ccx(312), _ccy(120), _ccx(305), _ccy(125), drawCircles: false);
    cubicTo(canvas, path, _ccx(300), _ccy(128), _ccx(301), _ccy(135), _ccx(305), _ccy(140), drawCircles: false);
    cubicTo(canvas, path, _ccx(306), _ccy(143), _ccx(313), _ccy(145), _ccx(315), _ccy(150), drawCircles: false);
    cubicTo(canvas, path, _ccx(305), _ccy(152), _ccx(300), _ccy(145), _ccx(295), _ccy(141), drawCircles: false);
    cubicTo(canvas, path, _ccx(288), _ccy(135), _ccx(293), _ccy(130), _ccx(288), _ccy(120), drawCircles: false);
    cubicTo(canvas, path, _ccx(285), _ccy(115), _ccx(278), _ccy(108), _ccx(272), _ccy(120), drawCircles: false);
    cubicTo(canvas, path, _ccx(270), _ccy(135), _ccx(260), _ccy(135), _ccx(260), _ccy(115), drawCircles: false);
    cubicTo(canvas, path, _ccx(258), _ccy(105), _ccx(250), _ccy(105), _ccx(245), _ccy(107), drawCircles: false);
    cubicTo(canvas, path, _ccx(247), _ccy(119), _ccx(227), _ccy(118), _ccx(239), _ccy(123), drawCircles: false);
    cubicTo(canvas, path, _ccx(249), _ccy(131), _ccx(224), _ccy(138), _ccx(230), _ccy(152), drawCircles: false);
    cubicTo(canvas, path, _ccx(218), _ccy(160), _ccx(228), _ccy(178), _ccx(210), _ccy(185), drawCircles: false);
    path.close();

    var shiftedPath = path.shift(Offset(translationX, 0));

    Paint paint = Paint()
      ..color = Color(0xffF9AF66)
      ..strokeWidth = 3.0
      ..strokeJoin = StrokeJoin.round
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;

    canvas.drawPath(shiftedPath, paint);
  }

  void _drawAsiaContinentShadow(Canvas canvas) {
    Path path = Path();
    path.moveTo(_ccx(210), _ccy(185));
    cubicTo(canvas, path, _ccx(200), _ccy(187), _ccx(210), _ccy(175), _ccx(202), _ccy(170), drawCircles: false);
    cubicTo(canvas, path, _ccx(195), _ccy(165), _ccx(205), _ccy(160), _ccx(198), _ccy(152), drawCircles: false);
    cubicTo(canvas, path, _ccx(190), _ccy(148), _ccx(208), _ccy(125), _ccx(175), _ccy(135), drawCircles: false);
    cubicTo(canvas, path, _ccx(152), _ccy(130), _ccx(163), _ccy(115), _ccx(172), _ccy(105), drawCircles: false);
    cubicTo(canvas, path, _ccx(180), _ccy(100), _ccx(170), _ccy(90), _ccx(181), _ccy(87), drawCircles: false);
    cubicTo(canvas, path, _ccx(190), _ccy(80), _ccx(172), _ccy(81), _ccx(180), _ccy(74), drawCircles: false);
    cubicTo(canvas, path, _ccx(182), _ccy(70), _ccx(200), _ccy(79), _ccx(203), _ccy(73), drawCircles: false);
    cubicTo(canvas, path, _ccx(209), _ccy(65), _ccx(195), _ccy(72), _ccx(194), _ccy(68), drawCircles: false);
    cubicTo(canvas, path, _ccx(192), _ccy(65), _ccx(200), _ccy(55), _ccx(210), _ccy(58), drawCircles: false);
    cubicTo(canvas, path, _ccx(230), _ccy(62), _ccx(240), _ccy(58), _ccx(250), _ccy(55), drawCircles: false);
    cubicTo(canvas, path, _ccx(270), _ccy(40), _ccx(280), _ccy(60), _ccx(300), _ccy(53), drawCircles: false);
    cubicTo(canvas, path, _ccx(310), _ccy(50), _ccx(322), _ccy(60), _ccx(330), _ccy(58), drawCircles: false);
    cubicTo(canvas, path, _ccx(335), _ccy(58), _ccx(345), _ccy(59), _ccx(349), _ccy(67), drawCircles: false);
    cubicTo(canvas, path, _ccx(345), _ccy(73), _ccx(335), _ccy(65), _ccx(325), _ccy(67), drawCircles: false);
    cubicTo(canvas, path, _ccx(308), _ccy(70), _ccx(330), _ccy(75), _ccx(320), _ccy(82), drawCircles: false);
    cubicTo(canvas, path, _ccx(311), _ccy(89), _ccx(348), _ccy(100), _ccx(310), _ccy(110), drawCircles: false);
    cubicTo(canvas, path, _ccx(293), _ccy(115), _ccx(312), _ccy(120), _ccx(305), _ccy(125), drawCircles: false);
    cubicTo(canvas, path, _ccx(300), _ccy(128), _ccx(301), _ccy(135), _ccx(305), _ccy(140), drawCircles: false);
    cubicTo(canvas, path, _ccx(306), _ccy(143), _ccx(313), _ccy(145), _ccx(315), _ccy(150), drawCircles: false);
    cubicTo(canvas, path, _ccx(305), _ccy(152), _ccx(300), _ccy(145), _ccx(295), _ccy(141), drawCircles: false);
    cubicTo(canvas, path, _ccx(288), _ccy(135), _ccx(293), _ccy(130), _ccx(288), _ccy(120), drawCircles: false);
    cubicTo(canvas, path, _ccx(285), _ccy(115), _ccx(278), _ccy(108), _ccx(272), _ccy(120), drawCircles: false);
    cubicTo(canvas, path, _ccx(270), _ccy(135), _ccx(260), _ccy(135), _ccx(260), _ccy(115), drawCircles: false);
    cubicTo(canvas, path, _ccx(258), _ccy(105), _ccx(250), _ccy(105), _ccx(245), _ccy(107), drawCircles: false);
    cubicTo(canvas, path, _ccx(247), _ccy(119), _ccx(227), _ccy(118), _ccx(239), _ccy(123), drawCircles: false);
    cubicTo(canvas, path, _ccx(249), _ccy(131), _ccx(224), _ccy(138), _ccx(230), _ccy(152), drawCircles: false);
    cubicTo(canvas, path, _ccx(218), _ccy(160), _ccx(228), _ccy(178), _ccx(210), _ccy(185), drawCircles: false);
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

  void _drawAmericaContinent(Canvas canvas) {
    Path path = Path();
    // draw America
    path.moveTo(_ccx(60), _ccy(60));
    path.quadraticBezierTo(_ccx(42), _ccy(60), _ccx(38), _ccy(72));
    path.quadraticBezierTo(_ccx(40), _ccy(80), _ccx(50), _ccy(73));
    path.quadraticBezierTo(_ccx(73), _ccy(62), _ccx(62), _ccy(90));
    path.quadraticBezierTo(_ccx(60), _ccy(90), _ccx(65), _ccy(100));
    path.quadraticBezierTo(_ccx(68), _ccy(105), _ccx(69), _ccy(115));
    path.quadraticBezierTo(_ccx(70), _ccy(122), _ccx(80), _ccy(122));
    path.quadraticBezierTo(_ccx(85), _ccy(122), _ccx(89), _ccy(132));
    path.quadraticBezierTo(_ccx(92), _ccy(138), _ccx(98), _ccy(138));
    path.quadraticBezierTo(_ccx(100), _ccy(142), _ccx(97), _ccy(148));
    path.quadraticBezierTo(_ccx(95), _ccy(156), _ccx(102), _ccy(160));
    path.quadraticBezierTo(_ccx(95), _ccy(156), _ccx(102), _ccy(160));
    path.cubicTo(_ccx(118), _ccy(170), _ccx(100), _ccy(190), _ccx(122), _ccy(210));
    path.cubicTo(_ccx(115), _ccy(200), _ccx(130), _ccy(190), _ccx(129), _ccy(185));
    path.cubicTo(_ccx(127), _ccy(183), _ccx(158), _ccy(150), _ccx(137), _ccy(148));
    path.cubicTo(_ccx(125), _ccy(148), _ccx(120), _ccy(122), _ccx(102), _ccy(130));
    path.cubicTo(_ccx(85), _ccy(132), _ccx(98), _ccy(125), _ccx(91), _ccy(118));
    path.cubicTo(_ccx(91), _ccy(110), _ccx(98), _ccy(118), _ccx(101), _ccy(103));
    path.cubicTo(_ccx(102), _ccy(94), _ccx(120), _ccy(89), _ccx(118), _ccy(89));
    path.cubicTo(_ccx(152), _ccy(82), _ccx(124), _ccy(80), _ccx(132), _ccy(68));
    path.cubicTo(_ccx(133), _ccy(66), _ccx(128), _ccy(64), _ccx(132), _ccy(58));
    path.cubicTo(_ccx(148), _ccy(52), _ccx(135), _ccy(70), _ccx(145), _ccy(70));
    cubicTo(canvas, path, _ccx(148), _ccy(72), _ccx(158), _ccy(59), _ccx(172), _ccy(55), drawCircles: false);
    cubicTo(canvas, path, _ccx(180), _ccy(34), _ccx(155), _ccy(54), _ccx(140), _ccy(45), drawCircles: false);
    cubicTo(canvas, path, _ccx(130), _ccy(40), _ccx(125), _ccy(58), _ccx(110), _ccy(51), drawCircles: false);
    cubicTo(canvas, path, _ccx(100), _ccy(45), _ccx(100), _ccy(70), _ccx(60), _ccy(60), drawCircles: false);
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
    path.moveTo(_ccx(60), _ccy(60));
    path.quadraticBezierTo(_ccx(42), _ccy(60), _ccx(38), _ccy(72));
    path.quadraticBezierTo(_ccx(40), _ccy(80), _ccx(50), _ccy(73));
    path.quadraticBezierTo(_ccx(73), _ccy(62), _ccx(62), _ccy(90));
    path.quadraticBezierTo(_ccx(60), _ccy(90), _ccx(65), _ccy(100));
    path.quadraticBezierTo(_ccx(68), _ccy(105), _ccx(69), _ccy(115));
    path.quadraticBezierTo(_ccx(70), _ccy(122), _ccx(80), _ccy(122));
    path.quadraticBezierTo(_ccx(85), _ccy(122), _ccx(89), _ccy(132));
    path.quadraticBezierTo(_ccx(92), _ccy(138), _ccx(98), _ccy(138));
    path.quadraticBezierTo(_ccx(100), _ccy(142), _ccx(97), _ccy(148));
    path.quadraticBezierTo(_ccx(95), _ccy(156), _ccx(102), _ccy(160));
    path.quadraticBezierTo(_ccx(95), _ccy(156), _ccx(102), _ccy(160));
    path.cubicTo(_ccx(118), _ccy(170), _ccx(100), _ccy(190), _ccx(122), _ccy(210));
    path.cubicTo(_ccx(115), _ccy(200), _ccx(130), _ccy(190), _ccx(129), _ccy(185));
    path.cubicTo(_ccx(127), _ccy(183), _ccx(158), _ccy(150), _ccx(137), _ccy(148));
    path.cubicTo(_ccx(125), _ccy(148), _ccx(120), _ccy(122), _ccx(102), _ccy(130));
    path.cubicTo(_ccx(85), _ccy(132), _ccx(98), _ccy(125), _ccx(91), _ccy(118));
    path.cubicTo(_ccx(91), _ccy(110), _ccx(98), _ccy(118), _ccx(101), _ccy(103));
    path.cubicTo(_ccx(102), _ccy(94), _ccx(120), _ccy(89), _ccx(118), _ccy(89));
    path.cubicTo(_ccx(152), _ccy(82), _ccx(124), _ccy(80), _ccx(132), _ccy(68));
    path.cubicTo(_ccx(133), _ccy(66), _ccx(128), _ccy(64), _ccx(132), _ccy(58));
    path.cubicTo(_ccx(148), _ccy(52), _ccx(135), _ccy(70), _ccx(145), _ccy(70));
    cubicTo(canvas, path, _ccx(148), _ccy(72), _ccx(158), _ccy(59), _ccx(172), _ccy(55), drawCircles: false);
    cubicTo(canvas, path, _ccx(180), _ccy(34), _ccx(155), _ccy(54), _ccx(140), _ccy(45), drawCircles: false);
    cubicTo(canvas, path, _ccx(130), _ccy(40), _ccx(125), _ccy(58), _ccx(110), _ccy(51), drawCircles: false);
    cubicTo(canvas, path, _ccx(100), _ccy(45), _ccx(100), _ccy(70), _ccx(60), _ccy(60), drawCircles: false);
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
