import 'package:cinemapedia/providers/storage/local_storage_service_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final isFavoriteProvider = FutureProvider.family.autoDispose((ref, int idMovie) {
  final service = ref.watch(localStorageServiceProvider);

  return service.isMovieFavorite(idMovie);
});
