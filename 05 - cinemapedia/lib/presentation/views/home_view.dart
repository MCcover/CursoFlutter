import 'package:cinemapedia/presentation/widgets/appbar/custom_appbar.dart';
import 'package:cinemapedia/presentation/widgets/carousel_movies/carousel_movies.dart';
import 'package:cinemapedia/presentation/widgets/horizontal_listview_movie/horizontal_listview_movie.dart';
import 'package:cinemapedia/presentation/widgets/screen_loader/screen_loader.dart';
import 'package:cinemapedia/providers/movie/initial_loading_provider.dart';
import 'package:cinemapedia/providers/movie/movies_providers.dart';
import 'package:cinemapedia/providers/movie/movies_slideshow_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {
  late final MoviesNotifier nowPlayingMoviesNotifier;
  late final MoviesNotifier popularMoviesNotifier;
  late final MoviesNotifier upcomingMoviesNotifier;
  late final MoviesNotifier topRatedMoviesNotifier;

  @override
  void initState() {
    super.initState();

    nowPlayingMoviesNotifier = ref.read(nowPlayingMoviesProvider.notifier);
    popularMoviesNotifier = ref.read(popularMoviesProvider.notifier);
    upcomingMoviesNotifier = ref.read(upcomingMoviesProvider.notifier);
    topRatedMoviesNotifier = ref.read(topRatedMoviesProvider.notifier);

    nowPlayingMoviesNotifier.loadNextPage();
    popularMoviesNotifier.loadNextPage();
    upcomingMoviesNotifier.loadNextPage();
    topRatedMoviesNotifier.loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final initialLoading = ref.watch(initialLoadingProvider);

    if (initialLoading) {
      return const ScreenLoader();
    }

    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final upcomingMovies = ref.watch(upcomingMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);
    final slideshowMovies = ref.watch(moviesSlideshowProvider);

    if (nowPlayingMovies.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            title: CustomAppbar(),
            titlePadding: EdgeInsetsDirectional.only(
              start: 0.0,
              bottom: 16.0,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Column(
                children: [
                  CarouselMovies(movies: slideshowMovies),
                  HorizontalListviewMovie(
                    movies: nowPlayingMovies,
                    title: "En cines",
                    subTitle: "Ahora",
                    loadNextPage: nowPlayingMoviesNotifier.loadNextPage,
                  ),
                  HorizontalListviewMovie(
                    movies: upcomingMovies,
                    title: "Proximamente",
                    subTitle: "En este mes",
                    loadNextPage: upcomingMoviesNotifier.loadNextPage,
                  ),
                  HorizontalListviewMovie(
                    movies: popularMovies,
                    title: "Populares",
                    loadNextPage: popularMoviesNotifier.loadNextPage,
                  ),
                  HorizontalListviewMovie(
                    movies: topRatedMovies,
                    title: 'Mejor calificadas',
                    subTitle: 'Desde siempre',
                    loadNextPage: topRatedMoviesNotifier.loadNextPage,
                  ),
                  const SizedBox(height: 10),
                ],
              );
            },
            childCount: 1,
          ),
        ),
      ],
    );
  }
}
