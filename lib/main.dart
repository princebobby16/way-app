import 'package:flutter/material.dart';
import 'package:way_app/src/components/bottom_navbar.dart';
import 'package:way_app/src/screens/home.dart';
import 'package:way_app/src/screens/login.dart';
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
      initialRoute: '/',
      routes: {
        '/login': (context) => Login(),
        '/home': (context) => Home(),
      },
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
    return Material(
      type: MaterialType.transparency,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/login');
        },
        child: Container(
          decoration: BoxDecoration(color: Colors.blueAccent),
          child: Center(
            child: Text('Way',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.bold)),
          ),
        ),
      ),
    );
  }
}
