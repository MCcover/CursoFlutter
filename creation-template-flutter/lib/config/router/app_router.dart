import 'package:drawer/main_wrapper.dart';
import 'package:drawer/presentation/pages/login/login_page.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/main',
      builder: (context, state) => const MainWrapper(),
    ),
    GoRoute(
      path: '/',
      redirect: (_, __) => "/login",
    ),
  ],
);
