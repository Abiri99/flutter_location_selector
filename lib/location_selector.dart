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
    _translationAnimation = Tween(begin: 0.0, end: -100.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
        reverseCurve: Curves.easeOut,
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
      color: Colors.grey,
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
          // SizedBox(width: 80,),
          Expanded(
            child: AspectRatio(
              aspectRatio: 800 / 520,
              child: AnimatedBuilder(
                animation: _animationController,
                builder: (context, _) => LayoutBuilder(
                  builder: (context, constraints) => Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: constraints.maxWidth - 16,
                        height: constraints.maxHeight - 16,
                        child: CustomPaint(
                          painter: WorldMapPainter(
                            developMode: false,
                            translationX: 0
                            // translationX: _translationAnimation.value,
                          ),
                        ),
                      ),
                      Container(
                        width: constraints.maxHeight,
                        height: constraints.maxHeight,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(1000)),
                          border: Border.all(
                            width: 2.0,
                            color: Color(0xff582D81),
                          ),
                        ),
                      ),
                    ],
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
