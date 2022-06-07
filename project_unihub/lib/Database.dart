import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future addUserInfoToDb(
      String userId, Map<String, dynamic> userInfoMap) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .collection("groups")
        .doc("rCKGvn85ew66rr7g1SoU")
        .set({"name": "Software Engineering", "id": ""});
    return FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .set(userInfoMap);
  }

  Future<DocumentSnapshot> getUserFromDb(String userId) async {
    return FirebaseFirestore.instance.collection("users").doc(userId).get();
  }

  /* bool checkIfUserExists(String email) {
    bool result = false;
    /* FirebaseFirestore.instance.collection("users").get().then((value) => {
          value.docs.forEach((element) {
            if (element.data().containsValue(email)) {
              result = true;
            }
          })
        }); */

    print(FirebaseFirestore.instance
        .collection("users")
        .get()
        .then((value) => value.docs.forEach((element) {
              element.data().containsValue(email);
            })));

    return result;
  } */
}
