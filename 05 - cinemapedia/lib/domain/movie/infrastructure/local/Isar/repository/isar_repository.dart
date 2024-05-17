import 'package:cinemapedia/domain/movie/infrastructure/local/abstracts/repository/a_local_storage_repository.dart';
import 'package:cinemapedia/domain/movie/model/movie.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarRepository extends ALocalStorageRepository {
  late Future<Isar> db;

  IsarRepository() {
    db = _openDb();
  }

  @override
  Future<bool> isMovieFavorite(int idMovie) async {
    final isar = await db;

    final Movie? isFavoriteMovie = await isar.movies.filter().idEqualTo(idMovie).findFirst();

    return isFavoriteMovie != null;
  }

  @override
  Future<void> toggleFavorite(Movie movie) async {
    final isar = await db;

    final favoriteMovie = await isar.movies.filter().idEqualTo(movie.id).findFirst();

    if (favoriteMovie != null) {
      isar.writeTxnSync(() => isar.movies.deleteSync(favoriteMovie.isarId));
      return;
    }
    isar.writeTxnSync(() => isar.movies.putSync(movie));
  }

  @override
  Future<List<Movie>> loadMovies({int limit = 10, offset = 0}) async {
    final isar = await db;

    return isar.movies.where().offset(offset).limit(limit).findAll();
  }

  Future<Isar> _openDb() async {
    final dir = await getApplicationDocumentsDirectory();

    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [MovieSchema],
        directory: dir.path,
        inspector: true,
      );
    }

    return Future.value(Isar.getInstance());
  }
}
