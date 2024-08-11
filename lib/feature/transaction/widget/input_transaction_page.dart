import 'package:catat/core/routing/routes/home_routes.dart';
import 'package:catat/core/routing/routes/transaction_routes.dart';
import 'package:catat/data/transaction/transaction_model.dart';
import 'package:catat/design/common/app_bar.dart';
import 'package:catat/design/common/loading_dialog.dart';
import 'package:catat/design/extensions/theme_extensions.dart';
import 'package:catat/design/my_ds/colors.dart';
import 'package:catat/feature/transaction/provider/input_transaction_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class InputTransactionPage extends StatelessWidget {
  const InputTransactionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => InputTransactionProvider(),
      child: _InputTransactionView(),
    );
  }
}

class _InputTransactionView extends StatefulWidget {
  @override
  State<_InputTransactionView> createState() => _InputTransactionViewState();
}

class _InputTransactionViewState extends State<_InputTransactionView> {
  final formKey = GlobalKey<FormState>();
  final nameFieldController = TextEditingController();
  final amountFieldController = TextEditingController();

  static const valueIncome = 'Income';
  static const valueExpenses = 'Expenses';
  String? _groupValue = valueIncome;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<InputTransactionProvider>();
    return Scaffold(
      appBar: popTextAppBar('Input Data Transaksi', context),
      body: Padding(
        padding: EdgeInsets.all(20.r),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 20.h),
              Text(
                'Masukkan Catatan',
                style: context.textTheme.titleLarge?.copyWith(
                  color: MyDsColors.newPrimaryBase,
                ),
              ),
              SizedBox(height: 40.h),
              DropdownButtonFormField(
                decoration: InputDecoration(
                  labelText: 'Jenis Transaksi',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1.w,
                      color: MyDsColors.neutralFour,
                    ),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Jenis transaksi tidak boleh kosong';
                  }
                  return null;
                },
                items: [
                  DropdownMenuItem(
                    value: valueIncome,
                    child: Text(
                      valueIncome,
                      style: context.textTheme.titleMedium,
                    ),
                  ),
                  DropdownMenuItem(
                    value: valueExpenses,
                    child: Text(
                      valueExpenses,
                      style: context.textTheme.titleMedium,
                    ),
                  ),
                ],
                onChanged: (value) {
                  _groupValue = value;
                },
              ),
              SizedBox(height: 20.h),
              TextFormField(
                controller: nameFieldController,
                decoration: InputDecoration(
                  labelText: 'Nama Transaksi',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1.w,
                      color: MyDsColors.neutralFour,
                    ),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama transaksi tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.h),
              TextFormField(
                controller: amountFieldController,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  labelText: 'Jumlah Transaksi',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1.w,
                      color: MyDsColors.neutralFour,
                    ),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Jumlah transaksi tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => context.pop(context),
                      child: const Text('Batalkan'),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          LoadingDialog.runWithLoading(
                            context,
                            () {
                              return provider
                                  .inputDataTransactions(
                                    TransactionModel(
                                      transactionId: DateTime.now()
                                          .millisecondsSinceEpoch
                                          .toString(),
                                      transactionName: nameFieldController.text,
                                      transactionType: _groupValue ?? '',
                                      transactionAmount:
                                          int.parse(amountFieldController.text),
                                      transactionDate:
                                          DateTime.now().toString(),
                                    ),
                                  )
                                  .then(
                                    (value) => Future.delayed(
                                      const Duration(seconds: 2),
                                      () => context
                                          .goNamed(HomeRoutes.main.name!),
                                    ),
                                  );
                            },
                          );
                        }
                      },
                      child: const Text('Simpan'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
