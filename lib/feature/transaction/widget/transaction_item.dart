import 'package:catat/core/formatter/currency_formatter.dart';
import 'package:catat/data/transaction/transaction_model.dart';
import 'package:catat/design/extensions/date_time_formatter_extension.dart';
import 'package:catat/design/extensions/theme_extensions.dart';
import 'package:catat/design/my_ds/colors.dart';
import 'package:catat/feature/transaction/detail_transaction_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransactionItem extends StatelessWidget {
  final TransactionModel dataTransaction;

  const TransactionItem({
    super.key,
    required this.dataTransaction,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showDialog(
        context: context,
        barrierDismissible: true,
        useRootNavigator: false,
        builder: (context) {
          return DetailTransactionView(
            transaksiId: dataTransaction.transactionId,
          );
        },
      ),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(20.r),
          child: Row(
            children: [
              Image.asset(
                dataTransaction.transactionType.toLowerCase() == 'income'
                    ? 'assets/images/ic_transaction_in.png'
                    : 'assets/images/ic_transaction_out.png',
                width: 24.r,
                height: 24.r,
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dataTransaction.transactionName,
                      style: context.textTheme.titleMedium,
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      DateTime.parse(dataTransaction.transactionDate)
                          .ddMMMMyyyy(dateDelimiter: ' '),
                      style: context.textTheme.labelLarge?.copyWith(
                        color: MyDsColors.granite,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                CurrencyFormatter.getCurrencyFormat(
                    dataTransaction.transactionAmount.toDouble()),
                style: context.textTheme.titleMedium?.copyWith(
                  color: dataTransaction.transactionType == 'income'
                      ? MyDsColors.success
                      : MyDsColors.alert,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
