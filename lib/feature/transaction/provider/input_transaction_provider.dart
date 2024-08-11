import 'package:catat/core/database/catat_database.dart';
import 'package:catat/data/transaction/transaction_model.dart';
import 'package:flutter/foundation.dart';

class InputTransactionProvider extends ChangeNotifier {
  CatatDatabase db = CatatDatabase.instance;

  InputTransactionProvider();

  Future<void> inputDataTransactions(TransactionModel data) async {
    await db.insertStudent(data);
    notifyListeners();
  }
}
