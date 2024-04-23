import 'package:cinemapedia/pages/movies/home_page.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: HomePage.name,
      builder: (context, state) => const HomePage(),
    ),
  ],
);
