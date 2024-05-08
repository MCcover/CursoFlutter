import 'package:cinemapedia/domain/movie/model/actor.dart';

abstract class AActorRepository {
  Future<List<Actor>> getActorsByMovie(String movieId);
}
