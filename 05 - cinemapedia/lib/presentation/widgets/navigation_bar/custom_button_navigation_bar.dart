import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottonNavigationBar extends StatelessWidget {
  final int currentIndex;
  const CustomBottonNavigationBar({
    super.key,
    required this.currentIndex,
  });

  void handleNavigationTap(BuildContext context, int page) {
    context.go('/home/$page');
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      onTap: (value) => handleNavigationTap(context, value),
      currentIndex: currentIndex,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_max_outlined),
          label: "Inicio",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.label_outline),
          label: "Categorias",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outline),
          label: "Favoritos",
        ),
      ],
    );
  }
}
