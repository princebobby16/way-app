import 'package:flutter/material.dart';
import 'package:way_app/src/components/input_field.dart';
import 'package:way_app/src/screens/signup_cont.dart' show VerifyScreenDetails;

class Verify extends StatefulWidget {
  const Verify({Key? key}) : super(key: key);

  @override
  _VerifyState createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {

  TextEditingController phoneNumber = TextEditingController();

  Widget _buildPhoneNumber(TextEditingController controller) {
    return WayInput(
      enabled: false,
        placeholder: 'phone number',
        icon: Icons.call,
        keyboardType: TextInputType.number,
        textEditingController: controller);
  }

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
                  IconButton(icon: Icon(Icons.arrow_back, color: Colors.black), onPressed: (){
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
                      // WayInput(enabled: false, textEditingController: phoneNumber, placeholder: 'phone number',),
                      SizedBox(height: 30),
                      ElevatedButton(
                        style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.lime),
                            padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 17.0)),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                                )
                            )
                        ),
                        onPressed: () {
                          // TODO: SEND DATA TO SERVER
                        },
                        child: Center(
                          child: Text('Send PIN',
                              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black54, letterSpacing: 1.5)
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      WayInput(placeholder: '_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _'),
                      SizedBox(height: 30),
                      ElevatedButton(
                        style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.lime),
                            padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 17.0)),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                                )
                            )
                        ),
                        onPressed: () {
                          // TODO: SEND DATA TO SERVER
                          Navigator.pushNamed(context, '/home');
                        },
                        child: Center(
                          child: Text('Sign Up',
                              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black54, letterSpacing: 1.5)
                          ),
                        ),
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
}
