import 'package:forms_app/pages/bloc/bloc_page.dart';
import 'package:forms_app/pages/cubits/cubits_page.dart';
import 'package:forms_app/pages/home/home_page.dart';
import 'package:forms_app/pages/register/register_page.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: HomePage.name,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/cubits',
      name: CubitPage.name,
      builder: (context, state) => const CubitPage(),
    ),
    GoRoute(
      path: '/bloc',
      name: BlocCounterPage.name,
      builder: (context, state) => const BlocCounterPage(),
    ),
    GoRoute(
      path: '/register',
      name: RegisterPage.name,
      builder: (context, state) => const RegisterPage(),
    ),
  ],
);
