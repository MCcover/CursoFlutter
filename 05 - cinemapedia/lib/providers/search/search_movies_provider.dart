import 'package:cinemapedia/domain/movie/model/movie.dart';
import 'package:cinemapedia/providers/movie/movie_service_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchQueryProvider = StateProvider((ref) => "");

final searchedMoviesProvider = StateNotifierProvider<SearchedMoviesNotifier, List<Movie>>((ref) {
  var fetchMovies = ref.read(movieServiceProvider).searchMovies;
  return SearchedMoviesNotifier(ref: ref, searchMovies: fetchMovies);
});

typedef SearchMoviesCallBack = Future<List<Movie>> Function(String query);

class SearchedMoviesNotifier extends StateNotifier<List<Movie>> {
  final SearchMoviesCallBack searchMovies;
  final Ref ref;

  SearchedMoviesNotifier({
    required this.ref,
    required this.searchMovies,
  }) : super([]);

  Future<List<Movie>> searchMoviesByQuery(String query) async {
    ref.read(searchQueryProvider.notifier).update((state) => query);

    final movies = await searchMovies(query);

    state = movies;

    return movies;
  }
}
