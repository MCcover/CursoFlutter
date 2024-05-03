import 'package:cinemapedia/domain/movie/model/movie.dart';
import 'package:cinemapedia/providers/movie/movie_service_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieInfoProvider = StateNotifierProvider<MovieMapNotifier, Map<int, Movie>>((ref) {
  final fetchMovie = ref.watch(movieServiceProvider).getMovieById;
  return MovieMapNotifier(getMovie: fetchMovie);
});

typedef GetMovieCallBack = Future<Movie> Function(int movieId);

class MovieMapNotifier extends StateNotifier<Map<int, Movie>> {
  final GetMovieCallBack getMovie;
  MovieMapNotifier({
    required this.getMovie,
  }) : super({});

  Future<void> loadMovie(int movieId) async {
    if (state[movieId] != null) {
      return;
    }

    final movie = await getMovie(movieId);

    state = {...state, movieId: movie};
  }
}
