import 'package:flutter/material.dart';
import 'package:flutter_country_selector/location_selector.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.brown,
      // backgroundColor: Color(0xff00a9cc),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 300,
              // color: Colors.brown,
              child: LocationSelector(),
            ),
          ],
        ),
      ),
    );
  }
}
