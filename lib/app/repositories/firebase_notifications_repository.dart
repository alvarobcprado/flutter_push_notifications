import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_push_notifications/app/models/app_message.dart';
import 'package:flutter_push_notifications/app/repositories/notifications_repository.dart';

@pragma('vm:entry-point')
Future<void> _backgroundMessageHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  final appMessage = AppMessage.fromMap(message.toMap());
  await FirebaseNotificationsRepository._onBackgroundMessage?.call(appMessage);
}

class FirebaseNotificationsRepository extends NotificationsRepository {
  const FirebaseNotificationsRepository();

  static AppMessageCallback? _onBackgroundMessage;

  @override
  Future<void> listenToBackgroundMessage(
    AppMessageCallback onBackgrounMessage,
  ) async {
    _onBackgroundMessage = onBackgrounMessage;
    FirebaseMessaging.onBackgroundMessage(_backgroundMessageHandler);
  }

  @override
  Future<void> listenToForegroundMessage(
    AppMessageCallback onForegroundMessage,
  ) async {
    FirebaseMessaging.onMessage.listen((message) async {
      await _processMessage(message, onForegroundMessage);
    });
  }

  @override
  Future<void> handleInitialMessage(
    AppMessageCallback onInitialMessage,
  ) async {
    final message = await FirebaseMessaging.instance.getInitialMessage();
    if (message != null) {
      await _processMessage(message, onInitialMessage);
    }
  }

  static Future<void> _processMessage(
    RemoteMessage message,
    AppMessageCallback onMessage,
  ) async {
    final appMessage = AppMessage.fromMap(message.toMap());
    await onMessage(appMessage);
  }
}
