import 'package:cinemapedia/domain/actors/infrastructure/repository/model/credits_response.dart';
import 'package:cinemapedia/domain/actors/model/actor.dart';

class ActorMapper {
  static Actor castToEntity(Cast cast) {
    return Actor(
      id: cast.id,
      name: cast.name,
      profilePath: cast.profilePath != null ? 'https://image.tmdb.org/t/p/w500${cast.profilePath}' : 'https://placehold.co/300x200',
      character: cast.character,
    );
  }
}
