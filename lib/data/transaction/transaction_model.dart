import 'package:catat/core/database/db_const.dart';

class TransactionModel {
  String transactionId;
  String transactionName;
  String transactionType;
  int transactionAmount;
  String transactionDate;

  TransactionModel({
    required this.transactionId,
    required this.transactionName,
    required this.transactionType,
    required this.transactionAmount,
    required this.transactionDate,
  });

  Map<String, dynamic> toJson() {
    return {
      DbConstant.transactionId: transactionId,
      DbConstant.transactionName: transactionName,
      DbConstant.transactionType: transactionType,
      DbConstant.transactionAmount: transactionAmount,
      DbConstant.transactionDate: transactionDate,
    };
  }

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      transactionId: json[DbConstant.transactionId],
      transactionName: json[DbConstant.transactionName],
      transactionType: json[DbConstant.transactionType],
      transactionAmount:
          int.tryParse(json[DbConstant.transactionAmount].toString()) ?? 0,
      transactionDate: json[DbConstant.transactionDate],
    );
  }
}
