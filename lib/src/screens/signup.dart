import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        style: ButtonStyle(
          elevation: MaterialStateProperty.all<double>(0.0),
        ),
        child: Icon(Icons.arrow_back),
      )),
      body: Center(child: Text('Under Construction')),
    );
  }
}
