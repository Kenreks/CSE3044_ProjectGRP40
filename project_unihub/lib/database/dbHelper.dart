import 'dart:convert';

import 'package:project_unihub/Models/UserModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io' as io;

class DbHelper {
  static Database? _db;

  static final String db_name = 'users.db';
  static final String table_user = 'user';
  static final int Version = 1;

  static const String c_userid = 'user_id';
  static const String c_username = 'user_name';
  static const String c_email = 'email';
  static const String c_password = 'password';

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }

    _db = await initDb();
    return _db;
  }

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, db_name);
    var db = await openDatabase(path, version: Version, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $table_user ($c_userid TEXT, $c_username TEXT, $c_email TEXT, $c_password TEXT, PRIMARY KEY ($c_userid))");
  }

  Future<UserModel> saveData(UserModel user) async {
    var dbClient = await db;
    user.userId = (await dbClient?.insert(table_user, user.toMap())).toString();
    return user;
  }

  Future<UserModel?> getLoginUser(String email, String password) async {
    var dbClient = await db;
    var res = await dbClient?.rawQuery(
        "SELECT * FROM $table_user WHERE $c_email = '$email' AND $c_password = '$password'");

    if (res!.isNotEmpty) {
      return UserModel.fromMap(res.first);
    }

    return null;
  }

  Future<bool> checkIfUserExists(String email) async {
    var dbClient = await db;
    var res = await dbClient
        ?.rawQuery("SELECT * FROM $table_user WHERE $c_email = '$email'");

    if (res!.isEmpty) {
      return false; //means user does not exist
    }
    return true;
  }

  Future<int> getRowNum() async {
    var dbClient = await db;
    var res =
        await dbClient?.rawQuery("SELECT COUNT('$c_userid') FROM $table_user");

    String strobj = jsonEncode(res![0]["COUNT('user_id')"]);

    int returnNum = int.parse(strobj);

    return returnNum;
  }

  void clearDb() async {
    //might be dangerous!
    var dbClient = await db;
    dbClient?.delete(table_user);
  }
}
