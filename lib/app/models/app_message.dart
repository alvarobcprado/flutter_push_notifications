import 'package:flutter_push_notifications/app/models/app_notification.dart';

class AppMessage {
  const AppMessage({
    this.notification,
    required this.data,
  });

  final AppNotification? notification;
  final Map<String, dynamic> data;

  Map<String, dynamic> toMap() {
    return {
      'notification': notification?.toMap(),
      'data': data,
    };
  }

  factory AppMessage.fromMap(Map<String, dynamic> map) {
    return AppMessage(
      notification: map['notification'] != null
          ? AppNotification.fromMap(map['notification'])
          : null,
      data: Map<String, dynamic>.from(map['data']),
    );
  }
}
