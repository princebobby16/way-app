import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:way_app/src/components/alert_box.dart';
import 'package:way_app/src/components/input_field.dart';
import 'package:way_app/src/models/login.dart';
import 'package:way_app/src/models/user.dart' as user;
import 'package:way_app/src/screens/signup_cont.dart' show VerifyScreenDetails;
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'package:sms_autofill/sms_autofill.dart';

class Verify extends StatefulWidget {
  const Verify({Key? key}) : super(key: key);

  @override
  _VerifyState createState() => _VerifyState();
}

class _VerifyState extends State<Verify> with CodeAutoFill {
  // local variables
  TextEditingController phoneNumber = TextEditingController();
  final RoundedLoadingButtonController _buttonController = RoundedLoadingButtonController();
  final RoundedLoadingButtonController _btnController = RoundedLoadingButtonController();

  String btnText = 'Send Pin';
  String _code = '';
  String appSignature = '';

  @override
  void initState() {
    super.initState();
    listenForCode();

    SmsAutoFill().getAppSignature.then((signature) {
      setState(() {
        appSignature = signature;
      });
    });
  }

  @override
  void dispose() {
    SmsAutoFill().unregisterListener();
    super.dispose();
    cancel();
  }

  ButtonStyle _elevatedButtonStyle() {
    return ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.lime),
        padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 17.0)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(40.0)),
            )
        )
    );
  }

  // local methods
  Widget _buildPhoneNumber(TextEditingController controller) {
    return WayInput(
      enabled: false,
        placeholder: 'phone number',
        icon: Icons.call,
        keyboardType: TextInputType.number,
        textEditingController: controller);
  }

  Future<void> showAlert(BuildContext context, String message) async {
    await showDialog<void>(
      context: context,
      builder: (BuildContext context) => WayAlertBox(
        message: message,
        title: 'Error',
      ),
    );
  }

  // build method: screen entry point
  @override
  Widget build(BuildContext context) {
    final args =
    ModalRoute.of(context)!.settings.arguments as VerifyScreenDetails;

    phoneNumber.text = args.phoneNumber;
    var num = phoneNumber.text.toString();

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
                  IconButton(icon: Icon(Icons.arrow_back, color: Colors.white), onPressed: (){
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
                    'Verification Pin',
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
                      _buildPhoneNumber(phoneNumber),
                      SizedBox(height: 30),
                      RoundedLoadingButton(
                        controller: _buttonController,
                        onPressed: () async {
                          await SmsAutoFill().listenForCode;
                          await getOTPAndShowAlertIfAnythingGoesWrong(args, context);
                        },
                        color: Colors.lime,
                        child: Text(btnText,
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 18.0,
                                letterSpacing: 1.5,
                                fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(height: 15),
                      PinFieldAutoFill(
                        decoration: UnderlineDecoration(
                          textStyle: TextStyle(fontSize: 20, color: Colors.white),
                          colorBuilder: FixedColorBuilder(Colors.white.withOpacity(0.7)),
                        ),
                        codeLength: 4,
                        currentCode: _code,
                        onCodeSubmitted: (code) {
                          _code = code;
                        },
                        onCodeChanged: (code) {
                          if (code!.length == 4) {
                            FocusScope.of(context).requestFocus(FocusNode());
                          }
                        },
                      ),
                      SizedBox(height: 30),
                      RoundedLoadingButton(
                        controller: _btnController,
                        onPressed: () async {
                          var t = await verifyPIN(args, context);
                          if (t == 0) {
                            return;
                          } else {
                            var resp = login(args.username, args.password);
                          }
                          // await Navigator.pushNamed(context, '/home');
                        },
                        color: Colors.lime,
                        child: Text('Verify Pin',
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 18.0,
                                letterSpacing: 1.5,
                                fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(height: 15),
                      Center(
                        child: Text('Sending PIN to $num',
                            style: TextStyle(fontSize: 15.0, color: Colors.white, letterSpacing: 1.5)
                        ),
                      ),
                      SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.pushNamed(context, '/login');
                            },
                            child: Text('Login', style: TextStyle(color: Colors.white)),
                          ),
                          Text('Verify Account', style: TextStyle(color: Colors.white))
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

  Future<void> getOTPAndShowAlertIfAnythingGoesWrong(VerifyScreenDetails args, BuildContext context) async {
    var resp = await user.requestOTP(args.phoneNumber);
    
    if (resp.code == 0) {
      await showAlert(context, resp.message);
      _buttonController.reset();
    }
    
    if (resp.code == 500) {
      await showAlert(context, resp.message);
      _buttonController.reset();
    }
    
    // store small data on disk
    if (resp.code == 200) {
      await showAlert(context, resp.message);
    
      Timer(Duration(milliseconds: 200), () {

        _buttonController.success();
    
      });
    
    }
  }

  Future<int> verifyPIN(VerifyScreenDetails args, BuildContext context) async {
    print('CODE: ' + _code);

    var type = 0;
    var resp = await user.verifyPIN(args.phoneNumber, _code);

    if (resp.code == 0) {
      await showAlert(context, resp.message);
      _btnController.reset();
    }

    if (resp.code == 500) {
      await showAlert(context, resp.message);
      _btnController.reset();
    }

    // store small data on disk
    if (resp.code == 201) {
      Timer(Duration(milliseconds: 200), () {

        _btnController.success();

      });
      type = 1;
    }
    return type;
  }

  @override
  void codeUpdated() {
    setState(() {
      _code = code!;
    });
  }
}
