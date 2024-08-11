import 'package:catat/core/formatter/currency_formatter.dart';
import 'package:catat/design/extensions/theme_extensions.dart';
import 'package:catat/design/my_ds/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomepageNew extends StatelessWidget {
  const HomepageNew({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyDsColors.darkBlue,
        body: Padding(
          padding: EdgeInsets.only(
            top: AppBar().preferredSize.height +
                MediaQuery.of(context).padding.top +
                24,
            bottom: 62 + MediaQuery.of(context).padding.bottom,
          ),
          child: Column(
            children: [
              Container(
                height: 280.h,
                width: double.infinity,
                margin: EdgeInsets.only(
                  left: 24.w,
                  right: 24.w,
                  top: 16.h,
                  bottom: 18.h,
                ),
                decoration: BoxDecoration(
                  color: MyDsColors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50.r),
                    bottomLeft: Radius.circular(20.r),
                    bottomRight: Radius.circular(50.r),
                    topRight: Radius.circular(20.r),
                  ),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: MyDsColors.white.withOpacity(0.2),
                      offset: const Offset(1.1, 1.1),
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 16.w,
                    right: 16.w,
                    top: 30.h,
                    bottom: 16.h,
                  ),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 48.h,
                                width: 3.w,
                                decoration: BoxDecoration(
                                  color: MyDsColors.success,
                                  borderRadius: BorderRadius.circular(4.r),
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Income',
                                    style:
                                        context.textTheme.titleMedium?.copyWith(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(height: 5.h),
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/ic_transaction_in.png',
                                        width: 24.r,
                                        height: 24.r,
                                      ),
                                      SizedBox(width: 5.w),
                                      Text(
                                        CurrencyFormatter.getCurrencyFormat(
                                          1000000,
                                        ),
                                        style: context.textTheme.titleMedium
                                            ?.copyWith(
                                          color: MyDsColors.success,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: 24.h),
                          Row(
                            children: [
                              Container(
                                height: 48.h,
                                width: 3.w,
                                decoration: BoxDecoration(
                                  color: MyDsColors.burgundy,
                                  borderRadius: BorderRadius.circular(4.r),
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Income',
                                    style:
                                        context.textTheme.titleMedium?.copyWith(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(height: 5.h),
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/ic_transaction_out.png',
                                        width: 24.r,
                                        height: 24.r,
                                      ),
                                      SizedBox(width: 5.w),
                                      Text(
                                        CurrencyFormatter.getCurrencyFormat(
                                          1000000,
                                        ),
                                        style: context.textTheme.titleMedium
                                            ?.copyWith(
                                          color: MyDsColors.burgundy,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
