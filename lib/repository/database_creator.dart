import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Database db;

class DatabaseCreator {
  // Defining the constants of the database
  static const passTable = 'pass';
  static const id = 'id';
  static const label = 'label';
  static const login = 'login';
  static const icon = 'icon';
  static const password = 'password';
  static const hasLogin = 'hasLogin';
  static const isProtected = 'isProtected';

  static void databaseLog(String functionName, String sql,
      [List<Map<String, dynamic>> selectQueryResult,
      int insertAndUpdateQueryResult,
      List<dynamic> params]) {
    print(functionName);
    print(sql);
    if (params != null) {
      print(params);
    }
    if (selectQueryResult != null) {
      print(selectQueryResult);
    } else if (insertAndUpdateQueryResult != null) {
      print(insertAndUpdateQueryResult);
    }
  }

  Future<void> createPassTable(Database db) async {
    final sql = '''CREATE TABLE $passTable
    (
      $id INTEGER PRIMARY KEY,
      $label TEXT,
      $login TEXT,
      $password TEXT,
      $icon INTEGER,
      $hasLogin BIT NOT NULL,
      $isProtected BIT NOT NULL
    )''';

    await db.execute(sql);
  }

  Future<String> getDatabasePath(String dbName) async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, dbName);

    //make sure the folder exists
    if (await Directory(dirname(path)).exists()) {
      //await deleteDatabase(path);
    } else {
      await Directory(dirname(path)).create(recursive: true);
    }
    return path;
  }

  Future<void> initDatabase() async {
    final path = await getDatabasePath('pass_db');
    db = await openDatabase(path, version: 1, onCreate: onCreate);
    print(db);
  }

  Future<void> onCreate(Database db, int version) async {
    await createPassTable(db);
  }
}
