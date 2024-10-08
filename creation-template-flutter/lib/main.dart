import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'helpers/windowsSize/window_size.dart';
import 'helpers/scrollBehavior/scroll_behavior.dart';
import 'package:drawer/config/theme/app_theme.dart';
import 'package:drawer/config/router/app_router.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');

  if (kDebugMode) {
    setWindowSize(width: 400, height: 700);
  }

  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
      routerConfig: appRouter,
      scrollBehavior: CustomScrollBehavior(),
    );
  }
}
