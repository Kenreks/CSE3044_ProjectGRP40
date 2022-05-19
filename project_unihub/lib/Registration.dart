import 'package:email_auth/email_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_unihub/Models/UserModel.dart';
import 'package:project_unihub/database/dbHelper.dart';
import 'package:project_unihub/screens/Login/components/body.dart';

class Registration {
  var dbHelper = DbHelper();
  EmailAuth emailAuth = new EmailAuth(sessionName: "Unihub");

  Future<bool> Login(String email, String password) async =>
      await dbHelper.getLoginUser(email, password).then((UserData) {
        if (UserData != null) {
          return true;
        } else {
          return false;
        }
      }).catchError((error) {
        print(error);
      });

  Future<bool> Signup(String fullname, String email, String password) async {
    if (!(await dbHelper.checkIfUserExists(email).then((value) => value))) {
      int idIncrement = (await dbHelper.getRowNum()) + 150110000;
      UserModel userModel =
          UserModel((idIncrement + 1).toString(), fullname, email, password);
      dbHelper.saveData(userModel).then((userData) {
        return true;
      }).catchError((error) {
        print(error);
      });
    } else {
      return false;
    }
    return true; //might be a problem there. check later.
  }

  bool passwordValidate(String value) {
    //String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';

    String pattern = r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}|(?=.*\W)$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  void sendCode(String email) async {
    var res = await emailAuth.sendOtp(recipientMail: email);
  }

  Future<bool> verifyCode(String email, String code) async {
    if (emailAuth.validateOtp(recipientMail: email, userOtp: code)) {
      return true;
    } else {
      return false;
    }
  }
}
