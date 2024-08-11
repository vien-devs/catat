import 'package:catat/core/routing/routes/home_routes.dart';
import 'package:catat/core/routing/routes/transaction_routes.dart';

class MainRoutes {
  MainRoutes._();

  static final routes = [
    ...HomeRoutes.mainRoutes,
    ...TransactionRoutes.mainRoutes,
  ];
}
