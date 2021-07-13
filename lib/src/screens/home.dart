import 'package:flutter/material.dart';
import 'package:way_app/src/components/bottom_navbar.dart';
import 'package:way_app/src/screens/map.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: WayMap(),
        extendBody: true,
        bottomNavigationBar: WayBottomNavBar()
    );;
  }
}
