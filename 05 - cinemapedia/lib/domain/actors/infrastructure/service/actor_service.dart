import 'package:cinemapedia/domain/actors/infrastructure/repository/a_actor_repository.dart';
import 'package:cinemapedia/domain/actors/infrastructure/service/a_actor_service.dart';
import 'package:cinemapedia/domain/actors/model/actor.dart';

class ActorService implements AActorService {
  late AActorRepository _actorRepository;

  ActorService(AActorRepository actorRepository) {
    _actorRepository = actorRepository;
  }

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) {
    return _actorRepository.getActorsByMovie(movieId);
  }
}
