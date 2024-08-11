import 'package:catat/core/routing/routes/main_routes.dart';
import 'package:catat/design/my_ds/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final goRouter = GoRouter(
    initialLocation: '/',
    routes: MainRoutes.routes,
  );

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: const Size(393, 830),
      splitScreenMode: false,
      useInheritedMediaQuery: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp.router(
          locale: const Locale('id', 'ID'),
          theme: myDsTheme(context),
          themeMode: ThemeMode.system,
          debugShowCheckedModeBanner: kDebugMode,
          routerConfig: goRouter,
        );
      },
    );
  }
}
