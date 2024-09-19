import 'package:cinemapedia/domain/movie/infrastructure/local/abstracts/service/a_local_storage_service.dart';
import 'package:cinemapedia/domain/movie/model/movie.dart';
import 'package:cinemapedia/providers/storage/local_storage_service_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final favoriteMovieProvider = StateNotifierProvider<StorageMoviesNotifier, Map<int, Movie>>((ref) {
  final service = ref.watch(localStorageServiceProvider);
  return StorageMoviesNotifier(service: service);
});

class StorageMoviesNotifier extends StateNotifier<Map<int, Movie>> {
  int page = 0;
  final ALocalStorageServie service;

  StorageMoviesNotifier({
    required this.service,
  }) : super({});

  Future<List<Movie>> loadNextPage() async {
    final movies = await service.loadMovies(offset: page * 20);
    page++;

    final Map<int, Movie> dic = {};

    for (final movie in movies) {
      dic[movie.id] = movie;
    }

    state = {...state, ...dic};

    return movies;
  }

  Future<void> toggleFavorite(Movie movie) async {
    await service.toggleFavorite(movie);

    final bool isMovieInFavorites = state[movie.id] != null;

    if (isMovieInFavorites) {
      state.remove(movie.id);

      state = {...state};
    } else {
      state = {...state, movie.id: movie};
    }
  }
}
