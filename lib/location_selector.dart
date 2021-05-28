import 'package:flutter/material.dart';
import 'package:flutter_country_selector/world_map_painter.dart';

class LocationSelector extends StatefulWidget {
  const LocationSelector({Key key}) : super(key: key);

  @override
  _LocationSelectorState createState() => _LocationSelectorState();
}

class _LocationSelectorState extends State<LocationSelector>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _translationAnimation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
      reverseDuration: Duration(seconds: 2),
    );
    _translationAnimation = Tween(begin: 0.0, end: 50.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
        reverseCurve: Curves.easeInOut,
      ),
    );
    // Future.delayed(Duration(seconds: 1), () {
    //   _animationController.forward();
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('width: ${MediaQuery.of(context).size.width}');
    print('height; ${MediaQuery.of(context).size.width * (520 / 800)}');
    return Container(
      color: Colors.blue,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Center(
          //   child: AspectRatio(
          //     aspectRatio: 800 / 520,
          //     child: Image.asset(
          //       'asset/world-map-simple.jpg', // image size: 800x520
          //       fit: BoxFit.fill,
          //     ),
          //   ),
          // ),
          Text('list'),
          SizedBox(width: 80,),
          Expanded(
            child: AspectRatio(
              aspectRatio: 800 / 520,
              child: AnimatedBuilder(
                animation: _animationController,
                builder: (context, _) => LayoutBuilder(
                  builder: (context, constraints) => Container(
                    width: constraints.maxWidth,
                    height: constraints.maxHeight,
                    child: CustomPaint(
                      painter: WorldMapPainter(
                        developMode: false,
                        translationX: _translationAnimation.value,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
