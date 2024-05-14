import 'package:cinemapedia/presentation/views/favorites_view.dart';
import 'package:cinemapedia/presentation/views/home_view.dart';
import 'package:cinemapedia/presentation/widgets/navigation_bar/custom_button_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const name = 'home-page';
  final int pageIndex;

  HomePage({
    super.key,
    required this.pageIndex,
  });

  final List<Widget> viewRoutes = [
    const HomeView(),
    const SizedBox(),
    const FavoritesView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: pageIndex,
        children: viewRoutes,
      ),
      bottomNavigationBar: CustomBottonNavigationBar(currentIndex: pageIndex),
    );
  }
}
