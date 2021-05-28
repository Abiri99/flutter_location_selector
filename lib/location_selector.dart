import 'package:flutter/material.dart';
import 'package:flutter_country_selector/constants.dart';
import 'package:flutter_country_selector/location_pin_painter.dart';
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

  PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(viewportFraction: 0.22);
    _pageController.addListener(() {
      setState(() {});
    });
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
      child: Stack(
        alignment: Alignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
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
          LayoutBuilder(
            builder: (context, constraints) => Container(
              height: constraints.maxHeight,

              // color: Colors.red,
              child: ShaderMask(
                shaderCallback: (Rect rect) {
                  return LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.white,
                      Colors.transparent,
                      Colors.transparent,
                      Colors.white
                    ],
                    stops: [
                      0.0,
                      0.2,
                      0.8,
                      1.0
                    ], // 10% purple, 80% transparent, 10% purple
                  ).createShader(rect);
                },
                blendMode: BlendMode.dstOut,
                child: PageView.builder(
                  restorationId: "0",
                  physics: BouncingScrollPhysics(),
                  controller: _pageController,
                  itemBuilder: (context, index) {
                    return Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 100,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24.0,
                                vertical: 8.0,
                              ),
                              margin: EdgeInsets.symmetric(
                                vertical: 8.0,
                                horizontal:
                                    (_pageController.page - index).abs() * 16.0 + 16.0,
                              ),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                // color: Colors.white,
                                // boxShadow: [
                                //   BoxShadow(
                                //     color: Colors.black12,
                                //     blurRadius: 15.0,
                                //   ),
                                // ],
                                borderRadius: BorderRadius.all(
                                  Radius.circular(100),
                                ),
                              ),
                              child: Text(
                                'Test',
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Container(
                              height: 2,
                              margin: EdgeInsets.symmetric(
                                vertical: 8.0,
                                horizontal:
                                (_pageController.page - index).abs() * 16.0 + 16.0,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.black54,
                                borderRadius: BorderRadius.all(Radius.circular(100)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                    // return Text(countries.elementAt(index));
                  },
                  itemCount: countries.length,
                  scrollDirection: Axis.vertical,
                ),
              ),
            ),
          ),
          // SizedBox(width: 80,),
          AspectRatio(
            aspectRatio: 800 / 520,
            child: AnimatedBuilder(
              animation: _animationController,
              builder: (context, _) => LayoutBuilder(
                builder: (context, constraints) => Padding(
                  padding: EdgeInsets.only(left: 110),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: constraints.maxWidth - 16,
                        height: constraints.maxHeight - 16,
                        child: CustomPaint(
                          painter: WorldMapPainter(
                              developMode: false, translationX: 0
                              // translationX: _translationAnimation.value,
                              ),
                          foregroundPainter: LocationPinPainter(),
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
