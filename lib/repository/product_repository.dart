import 'package:kasirin_flutter/database/database.dart';
import 'package:kasirin_flutter/models/product_model.dart';
import 'package:sqflite/sqflite.dart';

class ProductRepository {

  static final dbProvider  = DatabaseProvider.dbProvider;

  Future<List> getAllProduct() async {
    final db = await dbProvider.database;

    var result  = await db.query('product');
    print(result);
    return result.toList();
  }

  Future<List<ProductModel>> getProduct(id) async {
    final db = await dbProvider.database;

    List<Map<String, dynamic>> result;
    result  = await db.query('user', where: 'id = ?', whereArgs: [id]);
    List<ProductModel> _user = result.isNotEmpty
        ? result.map((item) => ProductModel.fromMap(item)).toList()
        : [];

    return _user;
  }

  Future storeProduct(ProductModel product) async {
    final db = await dbProvider.database;

    var result = await db.insert('product', product.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future updateProduct(ProductModel product) async {
    final db = await dbProvider.database;

    var result = await db.update('product', product.toMap(), where: 'id = ?', whereArgs: [product.id]);
  }

  Future deleteProduct(id) async {
    final db = await dbProvider.database;

    var result = await db.delete('product', where: 'id = ?', whereArgs: [id]);
  }
}