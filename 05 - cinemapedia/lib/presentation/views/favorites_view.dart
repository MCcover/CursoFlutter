import 'package:cinemapedia/providers/storage/favorite_movies_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritesView extends ConsumerStatefulWidget {
  const FavoritesView({super.key});

  @override
  FavoritesViewState createState() => FavoritesViewState();
}

class FavoritesViewState extends ConsumerState<FavoritesView> {
  @override
  void initState() {
    super.initState();
    ref.read(favoriteMovieProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final favoritesMovies = ref.watch(favoriteMovieProvider).entries.map((movie) => movie.value).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites View'),
      ),
      body: ListView.builder(
        itemCount: favoritesMovies.length,
        itemBuilder: (BuildContext context, int index) {
          final movie = favoritesMovies[index];
          return ListTile(
            title: Text(movie.title),
          );
        },
      ),
    );
  }
}
