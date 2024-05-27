import 'package:drawer/presentation/providers/drawerItem/drawer_item_provider.dart';
import 'package:drawer/presentation/widgets/drawer/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainWrapper extends StatelessWidget {
  const MainWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: CustomDrawer(),
      appBar: CustomAppBar(),
      body: AppBody(),
    );
  }
}

class CustomAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedMenu = ref.watch(drawerItemProvider);
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.white),
      title: Text(
        selectedMenu.title,
        style: const TextStyle(color: Colors.white),
      ),
      centerTitle: false,
      backgroundColor: const Color.fromARGB(255, 112, 119, 249),
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class AppBody extends ConsumerWidget {
  const AppBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedMenu = ref.watch(drawerItemProvider);

    return AnimatedSwitcher(
      switchInCurve: Curves.easeInExpo,
      switchOutCurve: Curves.easeOutExpo,
      duration: const Duration(milliseconds: 400),
      child: selectedMenu.navigationInfo.view,
    );
  }
}
