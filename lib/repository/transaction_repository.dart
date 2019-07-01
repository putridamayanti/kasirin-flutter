import 'package:kasirin_flutter/database/database.dart';
import 'package:kasirin_flutter/models/transaction_model.dart';
import 'package:sqflite/sqflite.dart';

class TransactionRepository {

  static final dbProvider  = DatabaseProvider.dbProvider;

  Future<List> getAllTransaction() async {
    final db = await dbProvider.database;

    var result  = await db.query('transaction');
    print(result);
    return result.toList();
  }

  Future<List<TransactionModel>> getTransaction(id) async {
    final db = await dbProvider.database;

    List<Map<String, dynamic>> result;
    result  = await db.query('transaction', where: 'id = ?', whereArgs: [id]);
    List<TransactionModel> _user = result.isNotEmpty
        ? result.map((item) => TransactionModel.fromMap(item)).toList()
        : [];

    return _user;
  }

  Future storeTransaction(TransactionModel product) async {
    final db = await dbProvider.database;

    var result = await db.insert('transaction', product.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future updateTransaction(TransactionModel product) async {
    final db = await dbProvider.database;

    var result = await db.update('transaction', product.toMap(), where: 'id = ?', whereArgs: [product.id]);
  }

  Future deleteTransaction(id) async {
    final db = await dbProvider.database;

    var result = await db.delete('transaction', where: 'id = ?', whereArgs: [id]);
  }
}