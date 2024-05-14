import 'package:cinemapedia/presentation/widgets/navigation_bar/custom_button_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const name = 'home-page';
  final Widget childView;

  const HomePage({
    super.key,
    required this.childView,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: childView,
      //HomeView()
      bottomNavigationBar: const CustomBottonNavigationBar(),
    );
  }
}
