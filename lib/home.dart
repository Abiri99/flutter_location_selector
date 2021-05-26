import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Center(
              child: AspectRatio(
                aspectRatio: 800 / 520,
                child: Image.asset(
                  'asset/world-map-simple.jpg', // image size: 800x520
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Center(
              child: AspectRatio(
                aspectRatio: 800 / 520,
                child: CustomPaint(
                  painter: WorldMapPainter(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WorldMapPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    // draw America
    path.moveTo(60, 60);
    path.quadraticBezierTo(46, 60, 37, 72);
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
    // path.lineTo(40, 70);

    Paint paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 3.0
      ..strokeJoin = StrokeJoin.round
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) =>
      this != oldDelegate;
}
