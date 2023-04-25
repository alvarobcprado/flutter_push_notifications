import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_push_notifications/app/models/app_message.dart';
import 'package:flutter_push_notifications/app/repositories/notifications_repository.dart';

class FirebaseNotificationsRepository extends NotificationsRepository {
  const FirebaseNotificationsRepository();

  @override
  Future<void> listenToBackgroundMessage(
    AppMessageCallback onBackgrounMessage,
  ) async {
    FirebaseMessaging.onBackgroundMessage((message) async {
      await _processMessage(message, onBackgrounMessage);
    });
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

  Future<void> _processMessage(
    RemoteMessage message,
    AppMessageCallback onMessage,
  ) async {
    final appMessage = AppMessage.fromMap(message.toMap());
    await onMessage(appMessage);
  }
}
