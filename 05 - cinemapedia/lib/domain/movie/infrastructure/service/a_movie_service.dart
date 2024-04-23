import 'package:cinemapedia/domain/movie/model/movie.dart';

abstract class AMovieService {
  Future<List<Movie>> getNowPlaying({int page = 1});
}
