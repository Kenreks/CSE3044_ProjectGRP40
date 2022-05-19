import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_unihub/components/button.dart';
import 'package:project_unihub/screens/Login/login_screen.dart';
import 'package:project_unihub/screens/Signup/signup_screen.dart';
import 'package:project_unihub/screens/components/background.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("Welcome\n       to", style: TextStyle(fontSize: 20)),
        Text("MarunHub",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black)),
        Button(
          text: "LOGIN",
          press: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return LoginScreen();
                },
              ),
            );
          },
        ),
        Button(
          text: "SIGN UP",
          color: Colors.orangeAccent,
          textcolor: Colors.black,
          press: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return SignUpScreen();
                },
              ),
            );
          },
        )
      ],
    ));
  }
}
