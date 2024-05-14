import 'package:cinemapedia/domain/movie/infrastructure/repository/a_movie_repository.dart';
import 'package:cinemapedia/domain/movie/model/movie.dart';
import 'package:cinemapedia/domain/movie/infrastructure/service/a_movie_service.dart';

class MovieService extends AMovieService {
  late AMovieRepository _movieRepository;

  MovieService(AMovieRepository movieRepository) {
    _movieRepository = movieRepository;
  }

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return _movieRepository.getNowPlaying(page: page);
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) {
    return _movieRepository.getPopular(page: page);
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) {
    return _movieRepository.getUpcoming(page: page);
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) {
    return _movieRepository.getTopRated(page: page);
  }

  @override
  Future<Movie> getMovieById(String id) {
    return _movieRepository.getMovieById(id);
  }

  @override
  Future<List<Movie>> searchMovies(String query) {
    return _movieRepository.searchMovies(query);
  }
}
