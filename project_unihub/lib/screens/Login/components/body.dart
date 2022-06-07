import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_unihub/auth.dart';
import 'package:project_unihub/components/button.dart';
import 'package:project_unihub/components/input_field.dart';
import 'package:project_unihub/components/password_field.dart';
import 'package:project_unihub/components/text_field_container.dart';
import 'package:project_unihub/screens/Login/components/background.dart';
import 'package:project_unihub/screens/Menu/menu_screen.dart';
import 'package:toast/toast.dart';
import 'package:project_unihub/Registration.dart';

late String email;
late String password;
Auth _authService = Auth();

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("LOGIN", style: TextStyle(fontWeight: FontWeight.bold)),
          InputField(
              hintText: "Email",
              icon: Icons.mail,
              onChanged: (value) {
                email = value;
              }),
          PasswordField(onChanged: (value) {
            password = value;
          }),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.deepOrange),
            height: 60,
            width: 200,
            child: Button(
                text: "LOGIN",
                press: () async {
                  if (!(email.contains('@'))) {
                    Toast.show("Please enter a valid email adress",
                        duration: Toast.lengthLong);
                  } else if (!(Auth().passwordValidate(password))) {
                    Toast.show(
                        "Password must contain minimum: one uppercase, lowercase, numeric number and special character",
                        duration: Toast.lengthLong);
                  } else {
                    try {
                      Auth().signIn(email, password);
                      Toast.show("Login successful!");
                      Navigator.pushNamed(context, 'menu');
                    } on FirebaseAuthException catch (e) {
                      if (!(Auth().checkPassword(password))) {
                        Toast.show("Incorrect password");
                      }
                    }

                    /* if (await registration.Login(email, password)) {
                      Toast.show("Login successful!");
                      Navigator.pushNamed(context, 'menu');
                    } else {
                      Toast.show("Wrong email or password");
                    } */
                  }
                }),
          ),
        ],
      ),
    );
  }
}
