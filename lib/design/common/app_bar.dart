import 'package:catat/design/my_ds/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar popTextAppBar(
  String title,
  context, {
  bool centerTitle = false,
  IconData icons = Icons.chevron_left,
  Color iconColor = MyDsColors.white,
  Color backgroundColor = MyDsColors.newPrimaryBase,
  Color textColor = MyDsColors.white,
  Function? onPop,
  List<Widget>? action,
  double elevation = 0.2,
}) {
  return AppBar(
    title: Text(title),
    titleSpacing: 0.0,
    centerTitle: centerTitle,
    titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
          fontSize: 18.sp,
          color: textColor,
        ),
    backgroundColor: backgroundColor,
    foregroundColor: Colors.black,
    elevation: elevation,
    leading: IconButton(
      onPressed: () {
        onPop != null ? onPop() : Navigator.of(context).pop();
      },
      icon: Icon(
        icons,
        size: 25.r,
        color: iconColor,
      ),
    ),
    actions: action,
  );
}
