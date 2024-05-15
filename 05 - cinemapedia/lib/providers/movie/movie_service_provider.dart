import 'package:cinemapedia/domain/movie/infrastructure/externals/moviebd/repository/movie_repository.dart';
import 'package:cinemapedia/domain/movie/infrastructure/externals/moviebd/service/movie_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieServiceProvider = Provider((ref) => MovieService(MovieRepository()));
