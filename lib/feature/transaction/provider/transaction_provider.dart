import 'package:catat/core/database/catat_database.dart';
import 'package:catat/data/transaction/transaction_model.dart';
import 'package:flutter/material.dart';

class TransactionProvider extends ChangeNotifier {
  CatatDatabase db = CatatDatabase.instance;
  List<TransactionModel> _transactions = [];

  List<TransactionModel> get transactions => [..._transactions];

  TransactionProvider(bool isHomepage, {bool needGetData = true}) {
    if (needGetData) {
      getDataTransactions(limit: isHomepage ? 5 : null);
    }
  }

  Future<void> getDataTransactions({int? limit}) async {
    _transactions.clear();
    _transactions = await db.getTransactions(limit: limit);
    notifyListeners();
  }

  Future<void> inputDataTransactions(TransactionModel data) async {
    await db.insertStudent(data);
    notifyListeners();
  }
}
