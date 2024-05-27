import 'package:drawer/presentation/widgets/drawer/model/menu_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final drawerItemProvider = AutoDisposeStateNotifierProvider<DrawerItemNotifier, MenuItem>(
  (ref) {
    return DrawerItemNotifier();
  },
);

class DrawerItemNotifier extends StateNotifier<MenuItem> {
  DrawerItemNotifier() : super(drawerItems[0]);

  void navigateTo(MenuItem destination) {
    if (state == destination) {
      return;
    }

    state = destination;
  }
}
