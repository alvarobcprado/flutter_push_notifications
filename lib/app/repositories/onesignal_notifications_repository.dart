import 'package:flutter_push_notifications/app/models/app_message.dart';
import 'package:flutter_push_notifications/app/models/app_notification.dart';
import 'package:flutter_push_notifications/app/repositories/notifications_repository.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class OnesignalNotificationsRepository extends NotificationsRepository {
  OnesignalNotificationsRepository() : super();

  @override
  Future<void> handleInitialMessage(
    AppMessageCallback onInitialMessage,
  ) async {
    OneSignal.shared.setNotificationOpenedHandler(
      (openedResult) {
        final appMessage = _convertToAppMessage(openedResult.notification);
        onInitialMessage(appMessage);
      },
    );
  }

  @override
  Future<void> listenToBackgroundMessage(
    AppMessageCallback onBackgrounMessage,
  ) async {}

  @override
  Future<void> listenToForegroundMessage(
    AppMessageCallback onForegroundMessage,
  ) async {
    OneSignal.shared.setNotificationWillShowInForegroundHandler(
      (OSNotificationReceivedEvent event) {
        final appMessage = _convertToAppMessage(event.notification);
        onForegroundMessage(appMessage);
      },
    );
  }

  AppMessage _convertToAppMessage(OSNotification notification) {
    return AppMessage(
      notification: AppNotification(
        title: notification.title,
        body: notification.body,
      ),
      data: notification.rawPayload ?? {},
    );
  }
}
