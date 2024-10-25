import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:push_app/config/local_notification/local_notification.dart';
import 'package:push_app/domain/push_message.dart';
import 'package:push_app/firebase_options.dart';

part 'notifications_event.dart';
part 'notifications_state.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationsBloc() : super(const NotificationsState()) {
    on<NotificationStatusChanged>(_notificationStatusChanged);

    on<NotificationRecieved>(_onNotificationRecieved);

    _initialStatusCheck();
    _onForegroundMessage();
  }

  static Future<void> initializeFirebase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  void _getFCMToken() async {
    final settings = await messaging.getNotificationSettings();
    if (settings.authorizationStatus != AuthorizationStatus.authorized) {
      return;
    }

    final fcmToken = await messaging.getToken();
    // ignore: avoid_print
    print("FCMToken $fcmToken");
  }

  void _handleRemoteMessage(RemoteMessage message) {
    if (message.notification == null) {
      return;
    }

    final notification = PushMessage(
      messageId: message.messageId?.replaceAll(':', '').replaceAll('%', '') ?? '',
      title: message.notification!.title ?? '',
      body: message.notification!.body ?? '',
      sendDate: message.sentTime ?? DateTime.now(),
      data: message.data,
      imageUrl: Platform.isAndroid ? message.notification!.android?.imageUrl : message.notification!.apple?.imageUrl,
    );

    // ignore: avoid_print
    print(notification);

    LocalNotifications.showLocalNotification(
      id: Random().nextInt(9999999),
      title: notification.title,
      body: notification.body,
      data: notification.messageId,
    );
    add(NotificationRecieved(notification));
  }

  void _onForegroundMessage() {
    FirebaseMessaging.onMessage.listen(_handleRemoteMessage);
  }

  void _initialStatusCheck() async {
    final settings = await messaging.getNotificationSettings();
    // await messaging.setAutoInitEnabled(true);
    add(NotificationStatusChanged(settings.authorizationStatus));
  }

  void requestPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: true,
      provisional: false,
      sound: true,
    );

    await LocalNotifications.requestPermissionLocalNotification();

    add(NotificationStatusChanged(settings.authorizationStatus));
  }

  void _notificationStatusChanged(NotificationStatusChanged event, Emitter<NotificationsState> emit) {
    emit(
      state.copyWith(status: event.status),
    );
    _getFCMToken();
  }

  void _onNotificationRecieved(NotificationRecieved event, Emitter<NotificationsState> emit) {
    var nots = [...state.notifications, event.message];

    emit(
      state.copyWith(notifications: nots),
    );
  }

  PushMessage? getMessageById(String pushMessageId) {
    final messages = state.notifications.where((x) => x.messageId == pushMessageId).toList();

    if (messages.isEmpty) {
      return null;
    }
    return messages[0];
  }
}
