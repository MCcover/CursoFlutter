import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/config/config.dart';
import 'package:riverpod_app/config/helpers/scrollBehavior/scroll_behavior.dart';
import 'package:riverpod_app/config/helpers/windowsSize/window_size.dart';
import 'package:riverpod_app/presentation/providers/state_providers.dart';

void main() {
  if (kDebugMode) {
    setWindowSize(width: 400, height: 700);
  }

  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final approuter = ref.watch(appRouterProvider);
    final darkMode = ref.watch(darkModeProvider);
    return MaterialApp.router(
      title: 'Riverpod Providers',
      debugShowCheckedModeBanner: false,
      routerConfig: approuter,
      theme: AppTheme(isDarkmode: darkMode).getTheme(),
      scrollBehavior: CustomScrollBehavior(),
    );
  }
}
