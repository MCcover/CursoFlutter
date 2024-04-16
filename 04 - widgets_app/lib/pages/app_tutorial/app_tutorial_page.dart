import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(
      {required this.title, required this.caption, required this.imageUrl});
}

final slides = [
  SlideInfo(
    title: "Busca la comida",
    caption:
        "Aliqua est incididunt consequat cupidatat quis. Veniam non ad Lorem dolor enim Lorem voluptate. Amet magna et anim officia in commodo pariatur. Lorem velit esse Lorem magna. Ea dolor eu enim dolore eu aliqua veniam non nostrud ex laborum. Reprehenderit incididunt sit laborum culpa esse.",
    imageUrl: "assets/images/1.png",
  ),
  SlideInfo(
    title: "Entrega rapida",
    caption:
        "Tempor culpa proident adipisicing adipisicing aliqua cupidatat non anim ut. Lorem enim laboris quis velit labore nostrud elit non id eiusmod. Laborum occaecat labore do occaecat culpa ut elit culpa sunt eu labore dolore commodo. Nostrud ut commodo deserunt enim anim nulla. Lorem magna labore commodo adipisicing ullamco.",
    imageUrl: "assets/images/2.png",
  ),
  SlideInfo(
    title: "Disfruta la comida",
    caption:
        "Reprehenderit dolore nisi nostrud consectetur anim occaecat id. Proident mollit voluptate laboris sint non amet id ad exercitation consequat amet. Est exercitation non esse veniam ullamco exercitation ut amet ipsum non irure. Esse ullamco ullamco duis proident. Aute cillum nisi qui aliquip est incididunt esse est ullamco proident anim ex. Reprehenderit reprehenderit in pariatur eiusmod excepteur culpa eu mollit nisi commodo et enim.",
    imageUrl: "assets/images/3.png",
  ),
];

class AppTutorialPage extends StatefulWidget {
  const AppTutorialPage({super.key});

  @override
  State<AppTutorialPage> createState() => _AppTutorialPageState();
}

class _AppTutorialPageState extends State<AppTutorialPage> {
  final PageController pageViewController = PageController();

  bool endReached = false;

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;
      if (!endReached && page >= (slides.length - 1.5)) {
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            children: slides
                .map((slideInfo) => _Slide(
                      info: slideInfo,
                    ))
                .toList(),
          ),
          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              child: const Text("Salir"),
              onPressed: () => context.pop(),
            ),
          ),
          endReached
              ? Positioned(
                  bottom: 30,
                  right: 30,
                  child: FadeInRight(
                    from: 15,
                    delay: const Duration(milliseconds: 200),
                    child: FilledButton(
                      onPressed: () => context.pop(),
                      child: const Text("Comenzar"),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final SlideInfo info;
  const _Slide({
    required this.info,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: AssetImage(info.imageUrl),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              info.title,
              style: titleStyle,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              info.caption,
              style: captionStyle,
            ),
          ],
        ),
      ),
    );
  }
}
