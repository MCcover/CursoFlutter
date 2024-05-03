import 'package:cinemapedia/domain/movie/infrastructure/repository/model/movie_details.dart';
import 'package:cinemapedia/domain/movie/infrastructure/repository/model/movie_moviedb.dart';
import 'package:cinemapedia/domain/movie/model/movie.dart';

class MovieMapper {
  static Movie movieDbToMovie(MovieMovieDb moviedb) {
    return Movie(
      adult: moviedb.adult,
      backdropPath: moviedb.backdropPath != '' ? 'https://image.tmdb.org/t/p/w500${moviedb.backdropPath}' : 'https://placehold.co/600x400',
      genreIds: moviedb.genreIds.map((e) => e.toString()).toList(),
      id: moviedb.id,
      originalLanguage: moviedb.originalLanguage,
      originalTitle: moviedb.originalTitle,
      overview: moviedb.overview,
      popularity: moviedb.popularity,
      posterPath: moviedb.posterPath != '' ? 'https://image.tmdb.org/t/p/w500${moviedb.posterPath}' : 'no-poster',
      releaseDate: moviedb.releaseDate,
      title: moviedb.title,
      video: moviedb.video,
      voteAverage: moviedb.voteAverage,
      voteCount: moviedb.voteCount,
    );
  }

  static Movie movieDetailsToMovie(MovieDetails moviedb) {
    return Movie(
      adult: moviedb.adult,
      backdropPath: moviedb.backdropPath != '' ? 'https://image.tmdb.org/t/p/w500${moviedb.backdropPath}' : 'https://placehold.co/600x400',
      genreIds: moviedb.genres.map((e) => e.name).toList(),
      id: moviedb.id,
      originalLanguage: moviedb.originalLanguage,
      originalTitle: moviedb.originalTitle,
      overview: moviedb.overview,
      popularity: moviedb.popularity,
      posterPath: moviedb.posterPath != '' ? 'https://image.tmdb.org/t/p/w500${moviedb.posterPath}' : 'https://placehold.co/600x400',
      releaseDate: moviedb.releaseDate,
      title: moviedb.title,
      video: moviedb.video,
      voteAverage: moviedb.voteAverage,
      voteCount: moviedb.voteCount,
    );
  }
}
