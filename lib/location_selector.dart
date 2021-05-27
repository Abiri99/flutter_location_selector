import 'package:flutter/material.dart';
import 'package:flutter_country_selector/world_map_painter.dart';

class LocationSelector extends StatelessWidget {
  const LocationSelector({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.center,
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
          Center(
            child: AspectRatio(
              aspectRatio: 800 / 520,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(1000)),
                child: CustomPaint(
                  painter: WorldMapPainter(
                    developMode: false,
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
