import 'package:flutter/material.dart';

class WayAlertBox extends StatelessWidget {
  const WayAlertBox({Key? key, required this.title, required this.message}) : super(key: key);

  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: <Widget>[
        // usually buttons at the bottom of the dialog
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Close'),
        ),
      ],
    );
  }
}
