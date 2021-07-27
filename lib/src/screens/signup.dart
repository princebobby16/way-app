import 'package:flutter/material.dart';
import 'package:way_app/src/components/input_field.dart';

class SignupScreenDetails {
  SignupScreenDetails({required this.firstName, required this.lastName, required this.phoneNumber});
  
  String firstName;
  String lastName;
  String phoneNumber;
}

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();

  Widget _buildFirstNameEmail() {
    return WayInput(placeholder: 'First Name', textEditingController: _firstName, icon: Icons.edit, keyboardType: TextInputType.name);
  }

  Widget _buildLastName() {
    return WayInput(placeholder: 'Last Name', textEditingController: _lastName, icon: Icons.all_inclusive_outlined, keyboardType: TextInputType.name);
  }

  Widget _buildPhoneNumber() {
    return WayInput(placeholder: 'Phone Number', textEditingController: _phoneNumber, icon: Icons.call, keyboardType: TextInputType.phone);
  }

  @override
  Widget build(BuildContext context) {
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
            duration: Duration(seconds: 2),
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 120.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 70),
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
                  SizedBox(height: 60),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildFirstNameEmail(),
                      SizedBox(height: 20),
                      _buildLastName(),
                      SizedBox(height: 20),
                      _buildPhoneNumber(),
                      SizedBox(height: 40),
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
                          // Send input data to next route
                          continueToNextRoute(context);
                        },
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                                Text('Next',
                                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black54, letterSpacing: 1.5)
                                ),
                              Icon(Icons.arrow_forward, color: Colors.black54,)
                            ],
                          )
                        ),
                      ),
                      SizedBox(height: 60),
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

  void continueToNextRoute(BuildContext context) {
    Navigator.pushNamed(
        context, 
        '/next',
      arguments: SignupScreenDetails(
          firstName: _firstName.text.toString(),
          lastName: _lastName.text.toString(),
          phoneNumber: _phoneNumber.text.toString()
      )
    );
  }
}
