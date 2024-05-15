import 'package:cinemapedia/domain/movie/infrastructure/local/abstracts/repository/a_local_storage_repository.dart';
import 'package:cinemapedia/domain/movie/infrastructure/local/abstracts/service/a_local_storage_service.dart';
import 'package:cinemapedia/domain/movie/model/movie.dart';

class IsarService extends ALocalStorageServie {
  final ALocalStorageRepository repository;

  IsarService(this.repository);

  @override
  Future<bool> isMovieFavorite(int idMovie) {
    return repository.isMovieFavorite(idMovie);
  }

  @override
  Future<List<Movie>> loadMovies({int limit = 10, offset = 0}) {
    return repository.loadMovies(limit: limit, offset: offset);
  }

  @override
  Future<void> toggleFavorite(Movie movie) {
    return repository.toggleFavorite(movie);
  }
}
