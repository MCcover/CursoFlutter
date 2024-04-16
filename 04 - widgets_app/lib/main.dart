import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/menu/routes/app_routes.dart';
import 'package:widgets_app/providers/theme_provider.dart';
import 'package:widgets_app/theme/app_theme.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
      };
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final colorSelected = ref.watch(selectedColorProvider);
    // final isDarkMode = ref.watch(isDarkModeProvider);
    final AppTheme appTheme = ref.watch(themeNotifierProvider);

    return MaterialApp.router(
      title: "Widgets App",
      routerConfig: appRoutes,
      debugShowCheckedModeBanner: false,
      theme: appTheme.getTheme(),
      scrollBehavior: MyCustomScrollBehavior(),
      // home: const Scaffold(
      //   body: HomePage(),
      // ),
      // routes: {
      //   '/buttons': (context) => const ButtonsPage(),
      //   '/cards': (contex) => const CardsPage(),
      // },
    );
  }
}
