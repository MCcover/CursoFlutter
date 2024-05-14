import 'package:cinemapedia/presentation/pages/movies/home_page.dart';
import 'package:cinemapedia/presentation/pages/movies/movie_page.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/home/0',
  routes: [
    GoRoute(
      path: '/home/:page',
      name: HomePage.name,
      builder: (context, state) => HomePage(
        pageIndex: int.tryParse(state.pathParameters['page'].toString()) ?? 0,
      ),
      routes: [
        GoRoute(
          path: 'movie/:id',
          name: MoviePage.name,
          builder: (context, state) => MoviePage(
            movieId: state.pathParameters['id'] ?? "no-id",
          ),
        ),
      ],
    ),
    GoRoute(
      path: '/',
      redirect: (_, __) => '/home/0',
    ),
  ],
);
