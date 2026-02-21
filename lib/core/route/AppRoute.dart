import 'package:apicalldemo/ui/screens/LoginScreen.dart';
import 'package:apicalldemo/ui/screens/ProductListScreen.dart';
import 'package:go_router/go_router.dart';

class AppRoute {
  static const String loginRoute = '/';
  static const String productListRoute = '/product-list';

  static final router = GoRouter(
    initialLocation: loginRoute,
    routes: [
      GoRoute(
        path: loginRoute,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: productListRoute,
        builder: (context, state) => const ProductListScreen(),
      ),
    ],
  );
}
