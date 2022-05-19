import 'package:flutter/material.dart';
import 'package:project_unihub/Models/UserModel.dart';
import 'package:project_unihub/components/button.dart';
import 'package:project_unihub/components/input_field.dart';
import 'package:project_unihub/components/password_field.dart';
import 'package:project_unihub/database/dbHelper.dart';
import 'package:project_unihub/screens/Menu/menu_screen.dart';
import 'package:project_unihub/screens/Signup/components/background.dart';
import 'package:toast/toast.dart';
import 'package:project_unihub/Registration.dart';

late String fullname = '';
late String email;
late String password;
late String code;
Registration registration = new Registration();
var dbHelper = DbHelper();

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
            suffixIcon: IconButton(
              icon: Icon(Icons.send),
              onPressed: () {
                if (email.contains("@marun.edu.tr")) {
                  registration.sendCode(email);
                  Toast.show("Code sent!");
                } else {
                  Toast.show(
                      "Please enter a valid email address to receive the code");
                }
              },
            ),
          ),
          PasswordField(onChanged: (value) {
            password = value;
          }),
          InputField(
            hintText: "Verification Code",
            icon: Icons.code,
            onChanged: (value) {
              code = value;
            },
          ),
          Button(
              text: "SIGNUP",
              press: () async {
                if (fullname == '') {
                  Toast.show("Please enter full name",
                      duration: Toast.lengthLong);
                } else if (!(email.contains('@marun.edu.tr'))) {
                  Toast.show("Please enter a valid email adress",
                      duration: Toast.lengthLong);
                } else if (!(registration.passwordValidate(password))) {
                  Toast.show(
                      "Password must contain minimum eight characters, at least one letter and one number",
                      duration: Toast.lengthLong);
                } else {
                  if (await registration.verifyCode(email, code)) {
                    if (await registration.Signup(fullname, email, password)) {
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
                  }
                }
              }),
        ],
      ),
    );
  }
}
