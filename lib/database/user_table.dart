import 'package:kasirin_flutter/database/database.dart';
import 'package:kasirin_flutter/models/user_model.dart';

class Usertable {
  static final dbProvider  = DatabaseProvider.dbProvider;


  Future<List<Map>> getUsers(UserModel user) async {
    final db      = await dbProvider.database;
    var response  = db.query('user');
    print(response);
    return response;
  }

  Future<int> storeUser(UserModel user) async {
    final db      = await dbProvider.database;
    var response  = db.insert('user', user.toMap());
    print(response);
    return response;
  }

  Future getUser(int id) async {
    final db      = await dbProvider.database;
    var response  = db.query('user',  where: 'id = ?', whereArgs: [id]);
    print(response);
    return response;
  }

  Future<int> updateUser(UserModel user) async {
    final db      = await dbProvider.database;
    var response  = db.update('user', user.toMap(), where: 'id = ?', whereArgs: [user.id]);
    print(response);
    return response;
  }

  Future<int> deleteUser(int id) async {
    final db      = await dbProvider.database;
    var response  = db.delete('user', where: 'id = ?', whereArgs: [id]);
    print(response);
    return response;
  }
}
