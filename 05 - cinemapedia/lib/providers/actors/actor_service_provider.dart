import 'package:cinemapedia/domain/actors/infrastructure/repository/actor_repository.dart';
import 'package:cinemapedia/domain/actors/infrastructure/service/actor_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorServiceProvider = Provider((ref) => ActorService(ActorRepository()));
