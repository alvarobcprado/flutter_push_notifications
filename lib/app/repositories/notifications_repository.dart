import 'package:flutter_push_notifications/app/models/app_message.dart';

typedef AppMessageCallback = Future<void> Function(AppMessage);

abstract class NotificationsRepository {
  const NotificationsRepository();

  Future<void> listenToBackgroundMessage(AppMessageCallback onBackgrounMessage);
  Future<void> listenToForegroundMessage(
    AppMessageCallback onForegroundMessage,
  );
  Future<void> handleInitialMessage(
    AppMessageCallback onInitialMessage,
  );
}
