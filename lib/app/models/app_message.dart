import 'package:flutter_push_notifications/app/models/app_notification.dart';

class AppMessage {
  const AppMessage({
    this.message,
    required this.data,
  });

  final AppNotification? message;
  final Map<String, dynamic> data;

  Map<String, dynamic> toMap() {
    return {
      'message': message?.toMap(),
      'data': data,
    };
  }

  factory AppMessage.fromMap(Map<String, dynamic> map) {
    return AppMessage(
      message: map['message'] != null
          ? AppNotification.fromMap(map['message'])
          : null,
      data: Map<String, dynamic>.from(map['data']),
    );
  }
}
