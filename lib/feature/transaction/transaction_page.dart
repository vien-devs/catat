import 'package:catat/core/routing/routes/transaction_routes.dart';
import 'package:catat/design/common/app_bar.dart';
import 'package:catat/design/my_ds/colors.dart';
import 'package:catat/feature/transaction/provider/transaction_provider.dart';
import 'package:catat/feature/transaction/widget/transaction_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TransactionProvider(false),
      child: _TransactionView(),
    );
  }
}

class _TransactionView extends StatefulWidget {
  @override
  State<_TransactionView> createState() => _TransactionViewState();
}

class _TransactionViewState extends State<_TransactionView> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<TransactionProvider>();

    return Scaffold(
      appBar: popTextAppBar(
        'Transaksi',
        context,
        action: [
          IconButton(
            onPressed: () =>
                context.pushNamed(TransactionRoutes.toInputTransaction.name!),
            highlightColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            icon: Icon(
              Icons.playlist_add,
              color: MyDsColors.newPrimaryInvert,
              size: 30.r,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
        child: ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: provider.transactions.length,
          itemBuilder: (context, index) {
            return TransactionItem(
              dataTransaction: provider.transactions[index],
            );
          },
        ),
      ),
    );
  }
}
