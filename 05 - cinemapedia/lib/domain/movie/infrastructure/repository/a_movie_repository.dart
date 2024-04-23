import 'package:cinemapedia/domain/movie/model/movie.dart';

abstract class AMovieRepository {
  Future<List<Movie>> getNowPlaying({int page = 1});
}
