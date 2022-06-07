import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_unihub/Database.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? username;

  Future<User?> getCurrentUser() async {
    return await _auth.currentUser;
  }

  Future<void> signUp(String fullname, String email, String password) async {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    Map<String, dynamic> userInfoMap = {
      "fullname": fullname,
      "email": email,
      "password": password
    };

    User? user = userCredential.user;

    username = fullname;

    if (userCredential != null) {
      DatabaseMethods().addUserInfoToDb(_auth.currentUser!.uid, userInfoMap);

      await user!.updateProfile(
        displayName: username,
      );
      await user.reload();
      user = await _auth.currentUser;
    }
  }

  Future<void> signIn(String email, String password) async {
    /* print(DatabaseMethods().checkIfUserExists(email)); */
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email, password: password);

    User? user = userCredential.user;

    username = await getFullname(getUid()); //FUTURE STRING TO STRING CAST!!!!

    if (user != null) {
      await user.updateProfile(
        displayName: username,
      );
      await user.reload();
      user = await _auth.currentUser;
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
  }

  String getUid() {
    return FirebaseAuth.instance.currentUser!.uid.toString();
  }

  Future<String?> getFullname(String uid) async {
    Map<String, dynamic>? dbmap;
    String? fullname;
    await DatabaseMethods()
        .getUserFromDb(uid)
        .then((value) => dbmap = value.data() as Map<String, dynamic>?);
    fullname = dbmap!['fullname'];
    return fullname;
  }

  bool checkPassword(String password) {
    print(DatabaseMethods()
        .getUserFromDb(getUid())
        .then((value) => print(value)));
    if (password ==
        DatabaseMethods()
            .getUserFromDb(getUid())
            .then((value) => password)
            .toString()) {
      return true;
    }
    return false;
  }

  bool passwordValidate(String value) {
    String pattern = r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}|(?=.*\W)$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  /* Map<String, dynamic> getdbmap() {

  } */
}
