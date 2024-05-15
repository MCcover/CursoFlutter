import 'package:cinemapedia/domain/actors/model/actor.dart';

abstract class AActorRepository {
  Future<List<Actor>> getActorsByMovie(String movieId);
}
