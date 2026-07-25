import 'package:go_router/go_router.dart';

import '../shared/splash_page.dart';
import '../features/authentication/presentation/login_page.dart';
import '../features/dashboard/presentation/dashboard_page.dart';

final appRouter = GoRouter(
  initialLocation: "/",

  routes: [

    GoRoute(
      path: "/",
      builder: (context, state) => const SplashPage(),
    ),

    GoRoute(
      path: "/login",
      builder: (context, state) => const LoginPage(),
    ),

    GoRoute(
      path: "/dashboard",
      builder: (context, state) => const DashboardPage(),
    ),
  ],
);