import 'package:app_flutter/assets/Login/users.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  final databaseName = "app.db";

  String users =
      "create table users (id INTEGER PRIMARY KEY AUTOINCREMENT, username TEXT UNIQUE, password TEXT)";
  Future<Database> initDB() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, databaseName);

    return openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute(users);
    });
  }

 // Método para insertar un nuevo usuario manualmente
Future<void> insertUserManually(String username, String password) async {
  final Database db = await initDB();
  
  await db.insert(
    'users',
    {'username': username, 'password': password},
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

  //Inicio de sesion
  Future<bool> login(Users user) async {
    final Database db = await initDB();

    var result = await db.rawQuery(
       "select * from users where username='${user.username}' AND password ='${user.password}'");
    if (result.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}

