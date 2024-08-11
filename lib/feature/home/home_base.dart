import 'package:catat/core/routing/routes/home_routes.dart';
import 'package:catat/design/extensions/theme_extensions.dart';
import 'package:catat/design/my_ds/colors.dart';
import 'package:catat/feature/home/home_page.dart';
import 'package:catat/feature/transaction/transaction_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class HomeBase extends StatefulWidget {
  const HomeBase({
    Key? key,
    required this.selectedPage,
  }) : super(key: key);

  final int selectedPage;

  @override
  State<HomeBase> createState() => _HomeBaseState();
}

class _HomeBaseState extends State<HomeBase> {
  int _currentPage = 0;
  PageController? _pageController;

  @override
  void initState() {
    super.initState();
    _currentPage = widget.selectedPage;
    _pageController = PageController(initialPage: _currentPage);
  }

  @override
  void didUpdateWidget(covariant HomeBase oldWidget) {
    super.didUpdateWidget(oldWidget);
    if ((widget.selectedPage != oldWidget.selectedPage) &&
        (widget.selectedPage != _currentPage)) {
      setState(() {
        _currentPage = widget.selectedPage;
        _pageController?.jumpToPage(_currentPage);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: const [
          HomePage(),
          TransactionPage(),
          Center(
            child: Text('Coming Soon'),
          ),
        ],
        onPageChanged: (value) => setState(
          () {
            _currentPage = value;
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0.2,
        type: BottomNavigationBarType.shifting,
        selectedLabelStyle: context.textTheme.bodySmall?.copyWith(
          fontWeight: FontWeight.w700,
        ),
        selectedItemColor: MyDsColors.newPrimaryBase,
        unselectedLabelStyle: context.textTheme.bodySmall,
        unselectedItemColor: MyDsColors.granite,
        showUnselectedLabels: true,
        onTap: (value) => setState(() {
          context.goNamed(
            HomeRoutes.main.name!,
            queryParameters: {
              'page': value.toString(),
            },
          );
        }),
        currentIndex: _currentPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 25.r,
            ),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.list_alt,
              size: 25.r,
            ),
            label: 'Transaksi',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.question_mark,
              size: 25.r,
            ),
            label: 'Coming Soon',
          ),
        ],
      ),
    );
  }
}

// bottomNavigationBar: MyBottomNavBar(
//   items: [
//     MyBottomNavBarItem(
//       iconData: Icons.home_filled,
//       text: 'Beranda',
//     ),
//     MyBottomNavBarItem(
//       iconData: Icons.question_mark,
//       text: 'Coming Soon',
//     ),
//   ],
//   centerItemText: 'Transaksi',
//   backgroundColor: MyDsColors.white,
//   color: MyDsColors.granite,
//   selectedColor: MyDsColors.newPrimaryBase,
//   notchedShape: const CircularNotchedRectangle(),
//   onTabSelected: (value) => setState(
//     () {
//       context.goNamed(
//         HomeRoutes.main.name!,
//         queryParameters: {
//           'page': value.toString(),
//         },
//       );
//     },
//   ),
// ),
// floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
// floatingActionButton: FloatingActionButton(
//   backgroundColor: MyDsColors.newPrimaryBase,
//   onPressed: () {},
//   elevation: 0.2,
//   child: const Icon(Icons.list_alt, color: MyDsColors.white),
// ),
