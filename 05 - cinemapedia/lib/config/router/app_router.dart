import 'package:cinemapedia/presentation/pages/movies/home_page.dart';
import 'package:cinemapedia/presentation/pages/movies/movie_page.dart';
import 'package:cinemapedia/presentation/views/home_views/favorites_view.dart';
import 'package:cinemapedia/presentation/views/home_views/home_view.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return HomePage(childView: child);
      },
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const HomeView(),
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
          path: '/favorites',
          builder: (context, state) => const FavoritesView(),
        ),
      ],
    ),
    // GoRoute(
    //   path: '/',
    //   name: HomePage.name,
    //   builder: (context, state) => const HomePage(
    //     childView: FavoritesView(),
    //   ),
    //   routes: [
    // GoRoute(
    //   path: 'movie/:id',
    //   name: MoviePage.name,
    //   builder: (context, state) => MoviePage(
    //     movieId: state.pathParameters['id'] ?? "no-id",
    //   ),
    // ),
    //   ],
    // ),
  ],
);
