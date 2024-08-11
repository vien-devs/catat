import 'package:catat/core/routing/routes/route_name.dart';
import 'package:catat/feature/home/home_page.dart';
import 'package:catat/feature/home/homepage_new.dart';
import 'package:go_router/go_router.dart';

class HomeRoutes {
  HomeRoutes._();

  static final mainRoutes = [
    main,
  ];

  static final main = GoRoute(
    path: PathRoute.homePage,
    name: RouteName.homepage,
    // builder: (context, state) => const HomePage(),
    builder: (context, state) => const HomepageNew(),
  );
}
