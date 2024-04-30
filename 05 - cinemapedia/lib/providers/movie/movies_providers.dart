import 'package:cinemapedia/domain/movie/infrastructure/service/a_movie_service.dart';
import 'package:cinemapedia/domain/movie/model/movie.dart';
import 'package:cinemapedia/providers/movie/movie_service_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nowPlayingMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final moviesService = ref.read(movieServiceProvider);

  return MoviesNotifier(movieService: moviesService);
});

class MoviesNotifier extends StateNotifier<List<Movie>> {
  int currentPage = 0;

  bool isLoading = false;

  late AMovieService _movieService;

  MoviesNotifier({
    required movieService,
  }) : super([]) {
    _movieService = movieService;
  }

  Future<void> loadNextPage() async {
    if (isLoading) {
      return;
    }

    isLoading = true;

    currentPage++;

    final List<Movie> movies =
        await _movieService.getNowPlaying(page: currentPage);

    state = [...state, ...movies];
    await Future.delayed(const Duration(milliseconds: 1000));
    isLoading = false;
  }
}
