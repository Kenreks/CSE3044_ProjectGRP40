import 'package:project_unihub/database/dbHelper.dart';

class UserModel {
  late String userId;
  late String fullname;
  late String email;
  late String password;

  UserModel(this.userId, this.fullname, this.email, this.password);

  /* Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'userId': userId,
      'fullname': fullname,
      'email': email,
      'password': password,
    };
    return map;
  } */

  Map<String, dynamic> toMap() {
    return {
      DbHelper.c_userid: userId,
      DbHelper.c_username: fullname,
      DbHelper.c_email: email,
      DbHelper.c_password: password,
    };
  }

  UserModel.fromMap(Map<String, dynamic> map) {
    userId = map['user_id'];
    fullname = map['user_name'];
    email = map['email'];
    password = map['password'];
  }
}
