import 'dart:io';

import 'package:catat/data/transaction/transaction_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'package:catat/core/database/db_const.dart';

class CatatDatabase {
  static Database? _db;

  // Singleton class
  CatatDatabase._privateConstructor();

  static final CatatDatabase instance = CatatDatabase._privateConstructor();

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDatabase();
    return _db!;
  }

  _initDatabase() async {
    Directory databasesPath = await getApplicationDocumentsDirectory();
    String path = join(databasesPath.path, DbConstant.dbName);

    return await openDatabase(
      path,
      version: DbConstant.dbVersion,
      onCreate: (db, version) async {
        var batch = db.batch();
        _createTableTransaction(batch);
        await batch.commit();
      },
    );
  }

  _createTableTransaction(Batch batch) {
    batch.execute('''CREATE TABLE ${DbConstant.tableTransaction}
        (${DbConstant.transactionId} TEXT PRIMARY KEY,
        ${DbConstant.transactionName} TEXT,
        ${DbConstant.transactionType} TEXT,
        ${DbConstant.transactionAmount} INTEGER,
        ${DbConstant.transactionDate} TEXT)''');
  }

  Future<int> insertStudent(TransactionModel transactionModel) async {
    Database db = await instance.database;

    return await db.insert(
      DbConstant.tableTransaction,
      transactionModel.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<TransactionModel>> getTransactions({int? limit}) async {
    Database db = await instance.database;

    var orderBy = '${DbConstant.transactionDate} DESC';
    var transactions = await db.query(DbConstant.tableTransaction,
        orderBy: orderBy, limit: limit);
    List<TransactionModel> result =
        transactions.map((e) => TransactionModel.fromJson(e)).toList();
    return result;
  }

  Future<TransactionModel> getDetailTransaction(String transactionId) async {
    Database db = await instance.database;

    var data = await db.query(
      DbConstant.tableTransaction,
      where: '${DbConstant.transactionId} = ?',
      whereArgs: [transactionId],
    );
    List<TransactionModel> result =
        data.map((e) => TransactionModel.fromJson(e)).toList();
    return result[0];
  }
}
