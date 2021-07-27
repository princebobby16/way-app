import 'package:flutter/material.dart';

class WayAlertBox extends StatelessWidget {
  const WayAlertBox({Key? key, required this.title, required this.message}) : super(key: key);

  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      // titlePadding: EdgeInsets.only(bottom: ),
      titleTextStyle: TextStyle(backgroundColor: Colors.red),
      content: Text(message),
    );
  }
}
