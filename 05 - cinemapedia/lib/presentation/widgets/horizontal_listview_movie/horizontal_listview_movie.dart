import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/domain/movie/model/movie.dart';
import 'package:cinemapedia/helpers/human_formats.dart';
import 'package:cinemapedia/presentation/widgets/custom_gradient/custon_gradient.dart';
import 'package:cinemapedia/providers/movie/is_favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HorizontalListviewMovie extends StatefulWidget {
  final List<Movie> movies;
  final String? title;
  final String? subTitle;
  final VoidCallback? loadNextPage;

  const HorizontalListviewMovie({
    super.key,
    required this.movies,
    this.title,
    this.subTitle,
    this.loadNextPage,
  });

  @override
  State<HorizontalListviewMovie> createState() => _HorizontalListviewMovieState();
}

class _HorizontalListviewMovieState extends State<HorizontalListviewMovie> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if (widget.loadNextPage == null) {
        return;
      }

      if (scrollController.position.pixels + 200 >= scrollController.position.maxScrollExtent) {
        widget.loadNextPage!();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Column(
        children: [
          _Title(
            title: widget.title,
            subTitle: widget.subTitle,
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: widget.movies.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return FadeInRight(
                  child: _Slide(
                    movie: widget.movies[index],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final String? title;
  final String? subTitle;
  const _Title({required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;

    if (title == null && subTitle == null) {
      return Container();
    }

    return Container(
      padding: const EdgeInsets.only(top: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Text(
            title ?? "",
            style: titleStyle,
          ),
          const Spacer(),
          subTitle != null && subTitle != ""
              ? FilledButton.tonal(
                  style: const ButtonStyle(visualDensity: VisualDensity.compact),
                  onPressed: () {},
                  child: Text(subTitle ?? ""),
                )
              : Container(),
        ],
      ),
    );
  }
}

class _Slide extends ConsumerWidget {
  final Movie movie;

  const _Slide({required this.movie});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyles = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _MoviePoster(
            movie: movie,
          ),
          SizedBox(
            width: 150,
            child: Text(
              movie.title,
              maxLines: 2,
              style: textStyles.titleSmall,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            width: 150,
            child: Row(
              children: [
                Icon(
                  Icons.star_half_outlined,
                  color: Colors.yellow.shade800,
                ),
                const SizedBox(
                  width: 3,
                ),
                Text(
                  movie.voteAverage.toStringAsFixed(1),
                  style: textStyles.bodyMedium?.copyWith(color: Colors.yellow.shade800),
                ),
                const Spacer(),
                Text(
                  HumanFormats.humanReadbleNumber(movie.popularity),
                  style: textStyles.bodySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MoviePoster extends ConsumerWidget {
  final Movie movie;

  const _MoviePoster({
    required this.movie,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFavoriteFuture = ref.watch(isFavoriteProvider(movie.id));

    return GestureDetector(
      onTap: () {
        context.push('/home/0/movie/${movie.id}');
      },
      child: SizedBox(
        height: 225,
        width: 150,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              _MovieImage(movie: movie),
              const CustomGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [0.0, 0.3],
                colors: [
                  Colors.black87,
                  Colors.transparent,
                ],
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      isFavoriteFuture.when(
                        data: (data) {
                          if (data) {
                            return const Icon(
                              size: 30,
                              Icons.favorite_rounded,
                              color: Colors.red,
                            );
                          } else {
                            return Container();
                          }
                        },
                        error: (_, __) => throw UnimplementedError(),
                        loading: () => const CircularProgressIndicator(strokeWidth: 2),
                      ),
                      const SizedBox(width: 5),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MovieImage extends StatelessWidget {
  final Movie movie;

  const _MovieImage({
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      movie.posterPath,
      fit: BoxFit.cover,
      width: 150,
      height: 225,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress != null) {
          return const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          );
        }
        return FadeIn(child: child);
      },
    );
  }
}
