import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:way_app/src/screens/bottom_navbar.dart';
import 'package:way_app/src/screens/map.dart';

void main() {
  runApp(Way());
}

class Way extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Way',
      debugShowCheckedModeBanner: false,
      home: WayHomePage(),
    );
  }
}

class WayHomePage extends StatefulWidget {
  WayHomePage({Key? key}) : super(key: key);

  @override
  _WayHomePageState createState() => _WayHomePageState();
}

class _WayHomePageState extends State<WayHomePage> {

  @override
  Widget build(BuildContext context) {
    var _index = 0;

    return Scaffold(
      body: WayMap(),
      extendBody: true,
      bottomNavigationBar: WayBottomNavBar()
    );
  }
}
