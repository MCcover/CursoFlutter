import 'package:cinemapedia/domain/movie/model/movie.dart';

abstract class ALocalStorageRepository {
  Future<void> toggleFavorite(Movie movie);

  Future<bool> isMovieFavorite(int idMovie);

  Future<List<Movie>> loadMovies({
    int limit = 10,
    offset = 0,
  });
}
