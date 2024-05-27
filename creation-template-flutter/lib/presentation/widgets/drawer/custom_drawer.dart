import 'package:drawer/presentation/providers/drawerItem/drawer_item_provider.dart';
import 'package:drawer/presentation/widgets/drawer/model/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          _drawerHeader(),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  _drawerItems(topItems),
                  const Spacer(),
                  _drawerItems(bottomItems),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawerHeader() {
    return const UserAccountsDrawerHeader(
      accountName: Text(
        'MC.cover',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      accountEmail: Text('joaquingonzalez008@gmail.com', style: TextStyle(color: Colors.white)),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 112, 119, 249),
      ),
      currentAccountPicture: CircleAvatar(
        backgroundImage: NetworkImage('https://avatars.githubusercontent.com/u/67832415?v=4'),
      ),
    );
  }

  Widget _drawerItems(List<MenuItem> items) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: items.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        var data = items[index];
        return DrawerNavigationItem(item: data);
      },
    );
  }
}

class DrawerNavigationItem extends ConsumerWidget {
  final MenuItem item;
  const DrawerNavigationItem({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedMenu = ref.watch(drawerItemProvider);

    return Column(
      children: [
        Card(
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          borderOnForeground: true,
          elevation: 0,
          margin: EdgeInsets.zero,
          child: Builder(
            builder: (BuildContext context) => ListTile(
              title: Text(
                item.title,
                style: TextStyle(
                  fontWeight: item == selectedMenu ? FontWeight.bold : FontWeight.w300,
                  color: item == selectedMenu ? const Color.fromARGB(255, 112, 119, 249) : Colors.grey[600],
                ),
              ),
              leading: Icon(
                item.leadingIcon,
                color: item == selectedMenu ? const Color.fromARGB(255, 112, 119, 249) : Colors.grey[600],
              ),
              onTap: () => _handleItemClick(context, item, ref),
            ),
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }

  void _handleItemClick(BuildContext context, MenuItem destination, WidgetRef ref) {
    if (destination.navigationInfo.view == null) {
      switch (destination.navigationInfo.navigationType) {
        case NavigationType.go:
          context.go(destination.navigationInfo.navigateTo!);
          break;
        case NavigationType.push:
          context.push(destination.navigationInfo.navigateTo!);
          break;
      }
    }

    ref.read(drawerItemProvider.notifier).navigateTo(destination);
    Navigator.pop(context);
  }
}
