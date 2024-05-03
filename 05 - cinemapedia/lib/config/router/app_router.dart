import 'package:cinemapedia/pages/movies/home_page.dart';
import 'package:cinemapedia/pages/movies/movie_page.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: HomePage.name,
      builder: (context, state) => const HomePage(),
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
  ],
);
