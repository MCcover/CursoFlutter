import 'package:cinemapedia/domain/movie/infrastructure/local/abstracts/repository/a_local_storage_repository.dart';
import 'package:cinemapedia/domain/movie/model/movie.dart';

class IsarRepository extends ALocalStorageRepository {
  @override
  Future<bool> isMovieFavorite(int idMovie) {
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>> loadMovies({int limit = 10, offset = 0}) {
    throw UnimplementedError();
  }

  @override
  Future<void> toggleFavorite(Movie movie) {
    throw UnimplementedError();
  }
}
