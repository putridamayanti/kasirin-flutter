import 'package:kasirin_flutter/database/database.dart';
import 'package:kasirin_flutter/models/user_model.dart';

class UserRepository {

  static final dbProvider  = DatabaseProvider.dbProvider;

  Future<List> getAllUser() async {
    final db = await dbProvider.database;

    var result  = await db.query('user');

    return result.toList();
    // print(result);
    // List<UserModel> _users = result.isNotEmpty
    //     ? result.map((item) => UserModel.fromDatabaseJson(item)).toList()
    //     : [];

    // return _users;
  }

  Future<List<UserModel>> getUser(id) async {
    print('Get $id');
    final db = await dbProvider.database;

    List<Map<String, dynamic>> result;
    result  = await db.query('user', where: 'id = ?', whereArgs: [id]);
    print(result);
    List<UserModel> _user = result.isNotEmpty
        ? result.map((item) => UserModel.fromDatabaseJson(item)).toList()
        : [];

    return _user;
  }

  Future login(username, password) async {
    print('Login Repo');
    final db = await dbProvider.database;

    List<Map<String, dynamic>> result;
    result  = await db.query('user', where: 'username = ?', whereArgs: [username]);
    print(result);
    if (result.isNotEmpty) {
      var data  = result.first;
      print('Data first $data');
      if (data['password'] == password) {
        print('Match');
        return data;
      }
    }
//    return result.isNotEmpty
//        ? UserModel.fromDatabaseJson(result.first)
//        : [];

//    if (result.length == 0) {
//      return {
//        'status'  : 'failed',
//        'message' : 'No Data'
//      };
//    } else {
//      print(result[0]['password']);
//      if (result[0]['password'] == password) {
//        List<UserModel> _user = result.map((item) => UserModel.fromDatabaseJson(item)).toList();
//        return _user;
//      } else {
//        return {
//          'status'  : 'failed',
//          'message' : 'Password Missmatch'
//        };
//      }
//    }
  }

}
