import 'package:catat/data/transaction/transaction_model.dart';
import 'package:catat/design/extensions/theme_extensions.dart';
import 'package:catat/design/my_ds/colors.dart';
import 'package:catat/feature/transaction/provider/transaction_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class InputTransactionView extends StatelessWidget {
  const InputTransactionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TransactionProvider(
        false,
        needGetData: false,
      ),
      child: _InputTransaction(),
    );
  }
}

class _InputTransaction extends StatefulWidget {
  @override
  State<_InputTransaction> createState() => _InputTransactionState();
}

class _InputTransactionState extends State<_InputTransaction> {
  final formKey = GlobalKey<FormState>();
  final nameFieldController = TextEditingController();
  final amountFieldController = TextEditingController();

  static const valueIncome = 'income';
  static const valueExpenses = 'expenses';

  String? _groupValue = valueIncome;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<TransactionProvider>();

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.r)),
      insetPadding: EdgeInsets.all(8.r),
      child: Padding(
        padding: EdgeInsets.all(20.r),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Tambah Transaksi',
                style: context.textTheme.titleLarge?.copyWith(
                  color: MyDsColors.newPrimaryBase,
                ),
              ),
              SizedBox(height: 20.h),
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
              SizedBox(height: 20.h),
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
                          context.pop(context);
                          provider.inputDataTransactions(
                            TransactionModel(
                              transactionId: DateTime.now()
                                  .millisecondsSinceEpoch
                                  .toString(),
                              transactionName: nameFieldController.text,
                              transactionType: _groupValue ?? '',
                              transactionAmount:
                                  int.parse(amountFieldController.text),
                              transactionDate: DateTime.now().toString(),
                            ),
                          );
                          // await CatatDatabase.instance.insertStudent(
                          //   TransactionModel(
                          //     transactionId: DateTime.now()
                          //         .millisecondsSinceEpoch
                          //         .toString(),
                          //     transactionName: nameFieldController.text,
                          //     transactionType: _groupValue ?? '',
                          //     transactionAmount:
                          //         int.parse(amountFieldController.text),
                          //     transactionDate: DateTime.now().toString(),
                          //   ),
                          // );
                          setState(() {});
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
