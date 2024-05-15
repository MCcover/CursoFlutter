import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/movie/infrastructure/externals/abstracts/repository/a_movie_repository.dart';
import 'package:cinemapedia/domain/movie/infrastructure/externals/moviebd/mappers/movie_mapper.dart';
import 'package:cinemapedia/domain/movie/infrastructure/externals/moviebd/repository/model/movie_details.dart';
import 'package:cinemapedia/domain/movie/infrastructure/externals/moviebd/repository/model/moviedb_response.dart';
import 'package:cinemapedia/domain/movie/model/movie.dart';
import 'package:dio/dio.dart';

class MovieRepository extends AMovieRepository {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'session_id': Environment.theMovieDbKey,
        'lenguage': 'es-ES',
      },
      headers: {
        'Authorization': 'Bearer ${Environment.theMovieDbJWT}',
      },
    ),
  );

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get(
      '/movie/now_playing',
      queryParameters: {
        'page': page,
      },
    );

    final movieDbResponse = MovieDbResponse.fromJson(response.data).results;

    final List<Movie> movies = movieDbResponse.where((e) => e.posterPath != 'no-poster').map((e) => MovieMapper.movieDbToMovie(e)).toList();

    return movies;
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    final response = await dio.get(
      '/movie/popular',
      queryParameters: {
        'page': page,
      },
    );

    final movieDbResponse = MovieDbResponse.fromJson(response.data).results;

    final List<Movie> movies = movieDbResponse.where((e) => e.posterPath != 'no-poster').map((e) => MovieMapper.movieDbToMovie(e)).toList();

    return movies;
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) async {
    final response = await dio.get(
      '/movie/upcoming',
      queryParameters: {
        'page': page,
      },
    );

    final movieDbResponse = MovieDbResponse.fromJson(response.data).results;

    final List<Movie> movies = movieDbResponse.where((e) => e.posterPath != 'no-poster').map((e) => MovieMapper.movieDbToMovie(e)).toList();

    return movies;
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {
    final response = await dio.get(
      '/movie/top_rated',
      queryParameters: {
        'page': page,
      },
    );

    final movieDbResponse = MovieDbResponse.fromJson(response.data).results;

    final List<Movie> movies = movieDbResponse.where((e) => e.posterPath != 'no-poster').map((e) => MovieMapper.movieDbToMovie(e)).toList();

    return movies;
  }

  @override
  Future<Movie> getMovieById(String id) async {
    final response = await dio.get(
      '/movie/$id',
    );

    if (response.statusCode != 200) {
      throw Exception("Movie with id: $id not found.");
    }

    final movieDb = MovieDetails.fromJson(response.data);

    final Movie movie = MovieMapper.movieDetailsToMovie(movieDb);

    return movie;
  }

  @override
  Future<List<Movie>> searchMovies(String query) async {
    if (query.trim().isEmpty) {
      return [];
    }

    final response = await dio.get(
      '/search/movie',
      queryParameters: {
        'query': query,
      },
    );

    final movieDbResponse = MovieDbResponse.fromJson(response.data).results;

    final List<Movie> movies = movieDbResponse.where((e) => e.posterPath != 'no-poster').map((e) => MovieMapper.movieDbToMovie(e)).toList();

    return movies;
  }
}
