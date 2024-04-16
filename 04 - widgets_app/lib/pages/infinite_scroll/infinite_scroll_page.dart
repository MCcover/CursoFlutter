import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfinitePage extends StatefulWidget {
  const InfinitePage({super.key});

  @override
  State<InfinitePage> createState() => _InfinitePageState();
}

class _InfinitePageState extends State<InfinitePage> {
  final int quantity = 5;

  final ScrollController scrollController = ScrollController();

  List<int> imagesIds = [];

  bool isLoading = false;
  bool isMounted = true;

  int randomImage() {
    return (Random().nextInt(200) + 1);
  }

  void addImages(int quantity) {
    for (var i = 0; i < quantity; i++) {
      imagesIds.add(randomImage());
    }
  }

  void moveScrollToBottom() {
    if ((scrollController.position.pixels + 150) <=
        scrollController.position.maxScrollExtent) {
      return;
    }

    scrollController.animateTo(
      scrollController.position.pixels + 150,
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
    );
  }

  Future loadNextPage(bool executesDelay) async {
    if (isLoading) {
      return;
    }

    isLoading = true;
    setState(() {});

    if (executesDelay) {
      await Future.delayed(const Duration(seconds: 2));
    }

    addImages(quantity);

    isLoading = false;

    if (!isMounted) {
      return;
    }

    setState(() {});

    moveScrollToBottom();
  }

  Future onRefresh() async {
    await Future.delayed(const Duration(seconds: 3));
    imagesIds.clear();
    loadNextPage(false);
  }

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if ((scrollController.position.pixels + 500) >=
              scrollController.position.maxScrollExtent &&
          !isLoading) {
        loadNextPage(true);
      }
    });

    addImages(quantity);
  }

  @override
  void dispose() {
    isMounted = false;
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Infinite'),
      ),
      body: RefreshIndicator(
        onRefresh: onRefresh,
        child: ListView.builder(
          controller: scrollController,
          itemCount: imagesIds.length,
          itemBuilder: (context, index) {
            return FadeInImage(
              fit: BoxFit.cover,
              width: double.infinity,
              height: 300,
              placeholder: const AssetImage("assets/images/jar-loading.gif"),
              image: NetworkImage(
                  "https://picsum.photos/id/${imagesIds[index]}/500/300"),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        child: isLoading
            ? FadeIn(
                child: SpinPerfect(
                  infinite: true,
                  child: const Icon(Icons.refresh_outlined),
                ),
              )
            : FadeIn(child: const Icon(Icons.arrow_back_ios_new_outlined)),
      ),
    );
  }
}
