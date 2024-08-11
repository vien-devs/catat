import 'package:catat/core/database/catat_database.dart';
import 'package:catat/core/formatter/currency_formatter.dart';
import 'package:catat/data/transaction/transaction_model.dart';
import 'package:catat/design/extensions/date_time_formatter_extension.dart';
import 'package:catat/design/extensions/theme_extensions.dart';
import 'package:catat/design/my_ds/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailTransactionView extends StatefulWidget {
  final String transaksiId;

  const DetailTransactionView({
    super.key,
    required this.transaksiId,
  });

  @override
  State<DetailTransactionView> createState() => _DetailTransactionViewState();
}

class _DetailTransactionViewState extends State<DetailTransactionView> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.r)),
      insetPadding: EdgeInsets.all(8.r),
      child: Padding(
        padding: EdgeInsets.all(20.r),
        child: FutureBuilder<TransactionModel>(
            future:
                CatatDatabase.instance.getDetailTransaction(widget.transaksiId),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Detail Catatanmu',
                      style: context.textTheme.titleLarge?.copyWith(
                        color: MyDsColors.newPrimaryBase,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    detailCatatanRow(
                        'ID Catatan', snapshot.data!.transactionId),
                    detailCatatanRow(
                      'Tanggal Catatan',
                      DateTime.parse(snapshot.data!.transactionDate)
                          .dMMMyyyyHHmm(dateDelimiter: ' '),
                    ),
                    detailCatatanRow(
                        'Nama Catatan', snapshot.data!.transactionName),
                    detailCatatanRow(
                      'Jumlah',
                      CurrencyFormatter.getCurrencyFormat(
                        snapshot.data!.transactionAmount.toDouble(),
                      ),
                    ),
                  ],
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(
                    color: MyDsColors.newPrimaryBase,
                  ),
                );
              }
            }),
      ),
    );
  }

  Padding detailCatatanRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: context.textTheme.titleSmall?.copyWith(
              color: MyDsColors.granite,
            ),
          ),
          Text(
            value,
            style: context.textTheme.titleMedium?.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
