import 'package:cinemapedia/domain/movie/infrastructure/local/Isar/repository/isar_repository.dart';
import 'package:cinemapedia/domain/movie/infrastructure/local/Isar/service/isar_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final localStorageServiceProvider = Provider((ref) => IsarService(IsarRepository()));
