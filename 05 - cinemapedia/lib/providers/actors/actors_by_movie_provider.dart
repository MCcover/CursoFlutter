import 'package:cinemapedia/domain/movie/model/actor.dart';
import 'package:cinemapedia/providers/actors/actor_service_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorsByMovieProvider = StateNotifierProvider<ActorsByMovieNotifier, Map<String, List<Actor>>>((ref) {
  final fetchActorsByMovie = ref.watch(actorServiceProvider).getActorsByMovie;

  return ActorsByMovieNotifier(fetchActorsByMovie: fetchActorsByMovie);
});

typedef GetActorsCallback = Future<List<Actor>> Function(String movieId);

class ActorsByMovieNotifier extends StateNotifier<Map<String, List<Actor>>> {
  final GetActorsCallback fetchActorsByMovie;

  ActorsByMovieNotifier({
    required this.fetchActorsByMovie,
  }) : super({});

  Future<void> loadActors(String movieId) async {
    if (state[movieId] != null) {
      return;
    }

    final List<Actor> actors = await fetchActorsByMovie(movieId);

    state = {...state, movieId: actors};
  }
}
