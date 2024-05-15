import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/actors/infrastructure/repository/a_actor_repository.dart';
import 'package:cinemapedia/domain/actors/infrastructure/repository/mappers/actor_mapper.dart';
import 'package:cinemapedia/domain/actors/infrastructure/repository/model/credits_response.dart';
import 'package:cinemapedia/domain/actors/model/actor.dart';
import 'package:dio/dio.dart';

class ActorRepository implements AActorRepository {
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
  Future<List<Actor>> getActorsByMovie(String movieId) async {
    final response = await dio.get(
      '/movie/$movieId/credits',
    );

    final movieDbResponse = CreditsResponse.fromJson(response.data).cast;

    final List<Actor> actors = movieDbResponse.map((e) => ActorMapper.castToEntity(e)).toList();

    return actors;
  }
}
