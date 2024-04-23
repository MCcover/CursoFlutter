import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/movie/infrastructure/mappers/movie_mapper.dart';
import 'package:cinemapedia/domain/movie/infrastructure/repository/model/moviedb_response.dart';
import 'package:cinemapedia/domain/movie/model/movie.dart';
import 'package:cinemapedia/domain/movie/infrastructure/repository/a_movie_repository.dart';
import 'package:dio/dio.dart';

class MovieRepository extends AMovieRepository {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'session_id': Environment.theMovieDbKey,
        'lenguage': 'es-MX',
      },
      headers: {
        'Authorization': 'Bearer ${Environment.theMovieDbJWT}',
      },
    ),
  );

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get('/movie/now_playing');

    final movieDbResponse = MovieDbResponse.fromJson(response.data).results;

    final List<Movie> movies = movieDbResponse.where((e) => e.posterPath != 'no-poster').map((e) => MovieMapper.movieDbToMovie(e)).toList();

    return movies;
  }
}
