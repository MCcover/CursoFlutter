import 'package:cinemapedia/domain/actors/model/actor.dart';

abstract class AActorService {
  Future<List<Actor>> getActorsByMovie(String movieId);
}
