import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  Widget _buildEmail() {
    return Container(
      alignment: Alignment.centerLeft,
      height: 60.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.blueAccent.withAlpha(100),
              spreadRadius: 5,
              blurRadius: 2,
              offset: Offset(0, 4), // changes position of shadow
            ),
          ]
      ),
      child: TextField(
        keyboardType: TextInputType.text,
        style: TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14.0),
            prefixIcon: Icon(Icons.email, color: Colors.white,),
            hintText: 'Username',
            hintStyle: TextStyle(color: Colors.white70)
        ),
      ),
    );
  }

  Widget _buildPassword() {
    return Container(
      alignment: Alignment.centerLeft,
      height: 60.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.blueAccent.withAlpha(100),
              spreadRadius: 5,
              blurRadius: 2,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ]
      ),
      child: TextField(
        keyboardType: TextInputType.text,
        obscureText: true,
        style: TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14.0),
            prefixIcon: Icon(Icons.lock, color: Colors.white,),
            hintText: 'Password',
            hintStyle: TextStyle(color: Colors.white70)
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
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
          ),
          Container(
            height: double.infinity,
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
                    'Login',
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
                      _buildEmail(),
                      SizedBox(height: 30),
                      _buildPassword(),
                      SizedBox(height: 60),
                      ElevatedButton(
                        style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.lime),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                )
                            )
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/home');
                        },
                      child: Center(
                        child: Text('Login', style: TextStyle(fontSize: 20.0, color: Colors.black54),),
                      ),
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
