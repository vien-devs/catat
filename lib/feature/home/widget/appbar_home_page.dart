import 'package:catat/design/extensions/theme_extensions.dart';
import 'package:catat/design/my_ds/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBarHomePage extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appbar;
  const AppBarHomePage({
    super.key,
    required this.appbar,
  });

  @override
  Size get preferredSize => Size.fromHeight(appbar.preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Padding(
        padding: EdgeInsets.only(left: 16.w),
        child: Text(
          'Catat - Keuanganmu',
          style: context.textTheme.titleLarge?.copyWith(
            color: MyDsColors.white,
          ),
        ),
      ),
      elevation: 0.2,
      backgroundColor: MyDsColors.newPrimaryBase,
      titleSpacing: 0,
    );
  }
}
