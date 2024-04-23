import 'package:cinemapedia/domain/movie/model/movie.dart';
import 'package:cinemapedia/providers/movie/movies_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final moviesSlideshowProvider = Provider<List<Movie>>((ref) {
  final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);

  if (nowPlayingMovies.isEmpty) {
    return [];
  }

  return nowPlayingMovies.take(6).toList();
});
