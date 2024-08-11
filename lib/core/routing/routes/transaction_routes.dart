import 'package:catat/core/routing/routes/route_name.dart';
import 'package:catat/feature/transaction/transaction_page.dart';
import 'package:catat/feature/transaction/widget/input_transaction_page.dart';
import 'package:go_router/go_router.dart';

class TransactionRoutes {
  TransactionRoutes._();

  static final mainRoutes = [
    toInputTransaction,
    toListTransactionPage,
  ];

  static final toInputTransaction = GoRoute(
    path: PathRoute.inputTransaction,
    name: RouteName.inputTransactionPage,
    builder: (context, state) => const InputTransactionPage(),
  );

  static final toListTransactionPage = GoRoute(
      path: PathRoute.listTransaction,
      name: RouteName.listTransactionPage,
      builder: (context, state) {
        return const TransactionPage();
      });
}
