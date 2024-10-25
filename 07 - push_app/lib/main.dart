import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:push_app/blocs/notifications/notifications_bloc.dart';
import 'package:push_app/config/local_notification/local_notification.dart';
import 'package:push_app/config/router/app_router.dart';
import 'package:push_app/config/theme/app_theme.dart';

import 'helpers/scrollBehavior/scroll_behavior.dart';
import 'helpers/windowsSize/window_size.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');

  if (kDebugMode) {
    setWindowSize(width: 400, height: 700);
  }

  WidgetsFlutterBinding.ensureInitialized();

  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  await NotificationsBloc.initializeFirebase();
  await LocalNotifications.initializeLocalNotifications();

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
      builder: (context, child) => HandleNotificationInteractions(child: child!),
    );
  }
}

class HandleNotificationInteractions extends StatefulWidget {
  final Widget child;
  const HandleNotificationInteractions({
    super.key,
    required this.child,
  });

  @override
  State<HandleNotificationInteractions> createState() => _HandleNotificationInteractionsState();
}

class _HandleNotificationInteractionsState extends State<HandleNotificationInteractions> {
  // It is assumed that all messages contain a data field with the key 'type'
  Future<void> setupInteractedMessage() async {
    RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }

    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  }

  void _handleMessage(RemoteMessage message) {
    Navigator.pushNamed(
      context,
      '/details/${message.messageId!.replaceAll(':', '').replaceAll('%', '')}',
    );
  }

  @override
  void initState() {
    super.initState();

    setupInteractedMessage();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
