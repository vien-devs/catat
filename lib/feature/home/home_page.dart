import 'package:catat/core/formatter/currency_formatter.dart';
import 'package:catat/core/routing/routes/transaction_routes.dart';
import 'package:catat/design/extensions/theme_extensions.dart';
import 'package:catat/design/my_ds/colors.dart';
import 'package:catat/feature/home/widget/appbar_home_page.dart';
import 'package:catat/feature/transaction/provider/transaction_provider.dart';
import 'package:catat/feature/transaction/widget/transaction_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TransactionProvider(true),
      child: _HomePageView(),
    );
  }
}

class _HomePageView extends StatefulWidget {
  @override
  State<_HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<_HomePageView> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<TransactionProvider>();

    return Scaffold(
      appBar: AppBarHomePage(
        appbar: AppBar(),
      ),
      backgroundColor: MyDsColors.newPrimaryInvert,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 180.h,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: MyDsColors.newPrimaryBase,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.w, top: 10.h, right: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Halo,',
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: MyDsColors.newPrimaryInvert,
                      ),
                    ),
                    Text(
                      'Tungirrr',
                      style: context.textTheme.titleLarge?.copyWith(
                        color: MyDsColors.newPrimaryInvert,
                      ),
                    ),
                    Text(
                      'Iniloh catatan-mu..',
                      style: context.textTheme.bodyLarge?.copyWith(
                        color: MyDsColors.newPrimaryInvert,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: IntrinsicHeight(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 16.h,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    CurrencyFormatter.getCurrencyFormat(
                                      1000000,
                                    ),
                                    style:
                                        context.textTheme.titleMedium?.copyWith(
                                      fontSize: 18.sp,
                                      color: MyDsColors.success,
                                    ),
                                  ),
                                  SizedBox(height: 5.h),
                                  Text(
                                    'Pemasukan kamu',
                                    style: context.textTheme.bodyMedium,
                                  ),
                                ],
                              ),
                              const VerticalDivider(
                                color: MyDsColors.granite,
                                thickness: 1,
                              ),
                              Column(
                                children: [
                                  Text(
                                    CurrencyFormatter.getCurrencyFormat(500000),
                                    style:
                                        context.textTheme.titleMedium?.copyWith(
                                      fontSize: 18.sp,
                                      color: MyDsColors.alert,
                                    ),
                                  ),
                                  SizedBox(height: 5.h),
                                  Text(
                                    'Pengeluaran kamu',
                                    style: context.textTheme.bodyMedium,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Catatan terakhir kamu',
                  style: context.textTheme.titleMedium?.copyWith(
                    color: MyDsColors.newPrimaryBase,
                  ),
                ),
                GestureDetector(
                  onTap: () => context.pushNamed(
                    TransactionRoutes.toListTransactionPage.name!,
                  ),
                  child: Text(
                    'Lihat semuanya',
                    style: context.textTheme.titleSmall,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
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
          ),
        ],
      ),
    );
  }
}
