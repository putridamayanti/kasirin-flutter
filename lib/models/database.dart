import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'package:kasirin_flutter/models/user_model.dart';

class DatabaseProvider {
  final DatabaseProvider dbProvider = DatabaseProvider();

  Database _database;

  Future<Database> get database async {
    print(_database);
    if (_database != null) return _database;
    _database = await createDatabase();
    return _database;
  }

  createDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path         = join(directory.path, 'kasirin.db');
  }

  void onUpgrade(Database database, int oldVersion, int newVersion) {
    if (newVersion > oldVersion) {}
  }
  void initDB(Database database, int version) async {
    await database.execute("CREATE TABLE user ("
        "id INTEGER PRIMARY KEY,"
        "username varchar(50),"
        "name varchar(50),"
        "password varchar(50),"
        "role varchar(50)"
        ")");
  }
}

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();

  Database _database;

  Future<Database> get database async {
    print(_database);
    if (_database != null) return _database;
    _database = await initDB();
//    final user = UserModel(1, 'Admin', 'admin', 'admin', 'Admin');
//    await createAdmin(user);
    return _database;
  }

  initDB() async {
    String documentsDirectory = await getDatabasesPath();
    String path = join(documentsDirectory, "Kasirin.db");
    print(path);
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
          print(db);
          if (db == null) {
            await db.execute("CREATE TABLE user ("
                "id INTEGER PRIMARY KEY,"
                "username varchar(50),"
                "name varchar(50),"
                "password varchar(50),"
                "role varchar(50)"
                ")");
            print('Database created');
            try {
              await db.rawInsert('INSERT INTO user (id, username, name, password, role) VALUES(1, "admin", "Admin", "admin", "Admin")');
              print('Success');
            } catch(err) {
              print(err);
            }
          }
    });
  }

  Future<void> createAdmin(UserModel user) async {
    final Database db = await _database;

    await db.insert('user', user.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  checkDatabase() async {
    print(_database);
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }
  
  Future<List<Map>> getAllData(table) async {
    final Database db = await _database;
    List<Map> result = await db.query(table);

    return result;
  }

  Future<List<Map>> getData(table, column, value) async {
    final Database db = await _database;
    List<Map> result = await db.query(table, where: '$column = ?', whereArgs: [value]);

    return result;
  }
}
