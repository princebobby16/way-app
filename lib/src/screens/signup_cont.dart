import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:shared_preferences/shared_preferences.dart'
    show SharedPreferences;
import 'package:way_app/src/components/alert_box.dart';
import 'package:way_app/src/components/input_field.dart';
import 'package:way_app/src/models/user.dart' as user;
import 'package:way_app/src/screens/signup.dart' show SignupScreenDetails;

class VerifyScreenDetails {
  VerifyScreenDetails({required this.userId, required this.phoneNumber});

  String userId;
  String phoneNumber;
}

class SignUpCont extends StatefulWidget {
  const SignUpCont({Key? key}) : super(key: key);

  @override
  _SignUpContState createState() => _SignUpContState();
}

class _SignUpContState extends State<SignUpCont> {
  late final TextEditingController username = TextEditingController();
  late final TextEditingController password = TextEditingController();
  late final TextEditingController passwordConf = TextEditingController();
  late final TextEditingController birthDay = TextEditingController();
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();

  Widget _buildUsername() {
    return WayInput(
        placeholder: 'Username',
        icon: Icons.person,
        keyboardType: TextInputType.text,
        textEditingController: username);
  }

  Widget _buildPassword() {
    return WayInput(
        placeholder: 'Password',
        icon: Icons.lock,
        hideText: true,
        textEditingController: password);
  }

  Widget _buildPasswordConfirmation() {
    return WayInput(
        placeholder: 'Confirm Password',
        icon: Icons.lock_outline_sharp,
        hideText: true,
        textEditingController: passwordConf);
  }

  Widget _buildBirthDay() {
    return WayInput(
        placeholder: 'BirthDay',
        icon: Icons.date_range,
        keyboardType: TextInputType.datetime,
        textEditingController: birthDay);
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as SignupScreenDetails;

    return Scaffold(
      body: Stack(
        children: [
          AnimatedContainer(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Color(0xFF73AEF5),
                  Color(0xFF61A4F1),
                  Color(0xFF478DE0),
                  Color(0xFF398AE5)
                ],
                    stops: [
                  0.1,
                  0.4,
                  0.7,
                  0.9
                ])),
            curve: Curves.easeInSine,
            duration: Duration(seconds: 1),
          ),
          AnimatedContainer(
            height: double.infinity,
            duration: Duration(seconds: 1),
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 120.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                  SizedBox(height: 30),
                  Text(
                    'Way',
                    style: TextStyle(
                        color: Colors.yellow,
                        fontFamily: 'Open Sans',
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Sign Up',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Open Sans',
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 40),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildUsername(),
                      SizedBox(height: 15),
                      _buildPassword(),
                      SizedBox(height: 15),
                      _buildPasswordConfirmation(),
                      SizedBox(height: 15),
                      _buildBirthDay(),
                      SizedBox(height: 30),
                      RoundedLoadingButton(
                        controller: _btnController,
                        onPressed: () async {
                          await continueToNextScreen(args, context);
                        },
                        color: Colors.lime,
                        child: Text('Sign Up',
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 18.0,
                                letterSpacing: 1.5,
                                fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/login');
                            },
                            child: Text('Login',
                                style: TextStyle(color: Colors.white)),
                          ),
                          Text('Verify Account',
                              style: TextStyle(color: Colors.white))
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> continueToNextScreen(
      SignupScreenDetails args, BuildContext context) async {
    var data = await sendDataToServer(args, context);

    if (data.ok == false) {
      Timer(Duration(seconds: 2), () {
        Timer(Duration(seconds: 1), () {
          _btnController.reset();
        });
        _btnController.error();
      });
      return;
    }

    Timer(Duration(seconds: 2), () {
      _btnController.success();
    });

    // navigate to next screen
    await Navigator.pushNamed(context, '/verify',
        arguments: VerifyScreenDetails(
            userId: data.preferences.getString('user_id').toString(),
            phoneNumber: args.phoneNumber));
  }

  Future<RequestData> sendDataToServer(
      SignupScreenDetails args, BuildContext context) async {
    print(args.firstName + ' === ' + args.lastName);
    print(username.text.toString() + ' === ' + password.text.toString());

    // for storing data on the disk
    final prefs = await SharedPreferences.getInstance();

    final ok = false;

    var data = RequestData(prefs, ok);

    var resp = await user.createUser(
        args.firstName,
        args.lastName,
        args.phoneNumber,
        username.text.toString(),
        password.text.toString(),
        passwordConf.text.toString());

    if (resp.code == 0) {
      await showAlert(context, resp);
      data = RequestData(prefs, false);
    }

    if (resp.code == 500) {
      await showAlert(context, resp);
      data = RequestData(prefs, false);
    }

    // store small data on disk
    if (resp.code == 200) {
      await prefs.setString('user_id', resp.userId);
      data = RequestData(prefs, true);
    }

    print(prefs.getString('user_id'));
    return data;
  }

  Future<void> showAlert(BuildContext context, user.Resp resp) async {
    await showDialog<void>(
      context: context,
      builder: (BuildContext context) => WayAlertBox(
        message: resp.message,
        title: 'Error',
      ),
    );
  }
}

// for implementing returning two variables from a function like in golang
class RequestData {
  RequestData(this.preferences, this.ok);

  final SharedPreferences preferences;
  final bool ok;
}
