import 'package:cinemapedia/providers/movie/movies_providers.dart';
import 'package:cinemapedia/providers/movie/movies_slideshow_provider.dart';
import 'package:cinemapedia/widgets/appbar/custom_appbar.dart';
import 'package:cinemapedia/widgets/carousel_movies/carousel_movies.dart';
import 'package:cinemapedia/widgets/horizontal_listview_movie/horizontal_listview_movie.dart';
import 'package:cinemapedia/widgets/navigation_bar/custom_button_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends StatelessWidget {
  static const name = 'home-page';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottonNavigationBar(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  late final MoviesNotifier nowPlayingMoviesNotifier;

  @override
  void initState() {
    super.initState();

    nowPlayingMoviesNotifier = ref.read(nowPlayingMoviesProvider.notifier);

    nowPlayingMoviesNotifier.loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final slideshowMovies = ref.watch(moviesSlideshowProvider);

    if (nowPlayingMovies.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return Column(
      children: [
        const CustomAppbar(),
        CarouselMovies(movies: slideshowMovies),
        HorizontalListviewMovie(
          movies: nowPlayingMovies,
          title: "En cines",
          subTitle: "Ahora",
          loadNextPage: nowPlayingMoviesNotifier.loadNextPage,
        ),
      ],
    );
  }
}
