import 'package:flutter/material.dart';
import 'package:way_app/src/screens/home.dart';
import 'package:way_app/src/screens/login.dart';
import 'package:way_app/src/screens/signup.dart';

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
      home: Login(),
      initialRoute: '/',
      routes: {
        '/home': (context) => Home(),
        '/signup': (context) => SignUp(),
      },
    );
  }
}