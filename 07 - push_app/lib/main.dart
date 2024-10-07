import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:push_app/blocs/notifications/notifications_bloc.dart';
import 'package:push_app/config/router/app_router.dart';
import 'package:push_app/config/theme/app_theme.dart';
import 'package:push_app/firebase_options.dart';

import 'helpers/scrollBehavior/scroll_behavior.dart';
import 'helpers/windowsSize/window_size.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');

  if (kDebugMode) {
    setWindowSize(width: 400, height: 700);
  }

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final fcmToken = await FirebaseMessaging.instance.getToken();
  await FirebaseMessaging.instance.setAutoInitEnabled(true);
  // ignore: avoid_print
  print("FCMToken $fcmToken");

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => NotificationsBloc()),
    ],
    child: const MainApp(),
  ));
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
