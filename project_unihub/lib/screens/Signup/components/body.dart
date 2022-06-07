import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project_unihub/auth.dart';
import 'package:project_unihub/components/button.dart';
import 'package:project_unihub/components/input_field.dart';
import 'package:project_unihub/components/password_field.dart';
import 'package:project_unihub/database/dbHelper.dart';
import 'package:project_unihub/screens/Menu/menu_screen.dart';
import 'package:project_unihub/screens/Signup/components/background.dart';
import 'package:toast/toast.dart';

late String fullname = '';
late String email;
late String password;
late String code;
var dbHelper = DbHelper();
Auth _authService = Auth();

class Body extends StatelessWidget {
  final Widget child;

  const Body({
    Key? key,
    required this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("SIGNUP", style: TextStyle(fontWeight: FontWeight.bold)),
          InputField(
            hintText: "Full Name",
            icon: Icons.person,
            onChanged: (value) {
              fullname = value;
            },
          ),
          InputField(
            hintText: "Email (@marun.edu.tr)",
            icon: Icons.mail,
            onChanged: (value) {
              email = value;
            },
          ),
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
                text: "SIGNUP",
                press: () async {
                  if (fullname == '') {
                    Toast.show("Please enter full name",
                        duration: Toast.lengthLong);
                  } else if (!(email.contains('@marun.edu.tr'))) {
                    Toast.show("Please enter a valid email adress",
                        duration: Toast.lengthLong);
                  } else if (!(Auth().passwordValidate(password))) {
                    Toast.show(
                        "Password must contain minimum eight characters, at least one letter and one number",
                        duration: Toast.lengthLong);
                  } else {
                    /* if (await registration.verifyCode(email, code)) {
                      if (await registration.Signup(
                          fullname, email, password)) {
                        Toast.show("Signup successfull",
                            duration: Toast.lengthShort);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return MenuScreen();
                        }));
                      } else {
                        Toast.show("User already exists",
                            duration: Toast.lengthShort);
                      }
                    } else {
                      Toast.show("Couldn't verify the code",
                          duration: Toast.lengthShort);
                    } */
                    try {
                      await Auth().signUp(fullname, email, password);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return MenuScreen();
                      }));
                    } on FirebaseException catch (e) {}
                    ;
                  }
                }),
          ),
        ],
      ),
    );
  }
}
