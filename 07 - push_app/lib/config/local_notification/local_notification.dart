import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:push_app/config/router/app_router.dart';

class LocalNotifications {
  static Future<void> requestPermissionLocalNotification() async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.requestNotificationsPermission();
  }

  static Future<void> initializeLocalNotifications() async {
    final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    const android = AndroidInitializationSettings('app_icon');

    const initializationSettings = InitializationSettings(
      android: android,
    );

    flutterLocalNotificationsPlugin.initialize(initializationSettings, onDidReceiveNotificationResponse: onDidReceiveNotificationResponse);
  }

  static void showLocalNotification({
    required int id,
    String? title,
    String? body,
    String? data,
  }) {
    const androidDetails = AndroidNotificationDetails(
      'channelId',
      'channelName',
      playSound: true,
      importance: Importance.max,
      priority: Priority.max,
    );

    const notificationDetails = NotificationDetails(
      android: androidDetails,
    );

    final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.show(id, title, body, notificationDetails, payload: data);
  }

  static void onDidReceiveNotificationResponse(NotificationResponse details) {
    appRouter.push('/details/${details.payload}');
  }
}
