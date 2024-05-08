import 'package:cinemapedia/domain/movie/model/actor.dart';

abstract class AActorService {
  Future<List<Actor>> getActorsByMovie(String movieId);
}
