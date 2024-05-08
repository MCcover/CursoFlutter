import 'package:cinemapedia/domain/movie/model/movie.dart';
import 'package:cinemapedia/providers/movie/movie_service_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieInfoProvider = StateNotifierProvider<MovieMapNotifier, Map<String, Movie>>((ref) {
  final fetchMovie = ref.watch(movieServiceProvider).getMovieById;
  return MovieMapNotifier(getMovie: fetchMovie);
});

typedef GetMovieCallBack = Future<Movie> Function(String movieId);

class MovieMapNotifier extends StateNotifier<Map<String, Movie>> {
  final GetMovieCallBack getMovie;
  MovieMapNotifier({
    required this.getMovie,
  }) : super({});

  Future<void> loadMovie(String movieId) async {
    if (state[movieId] != null) {
      return;
    }

    final movie = await getMovie(movieId);

    state = {...state, movieId: movie};
  }
}
