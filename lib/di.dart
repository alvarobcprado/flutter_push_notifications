import 'package:auto_injector/auto_injector.dart';
import 'package:flutter_push_notifications/app/pages/home/home_notifier.dart';
import 'package:flutter_push_notifications/app/repositories/notifications_repository.dart';
import 'package:flutter_push_notifications/app/repositories/onesignal_notifications_repository.dart';

final autoInjector = AutoInjector(
  on: (injector) {
    injector.addLazySingleton<NotificationsRepository>(
      OnesignalNotificationsRepository.new,
    );
    injector.add(HomeNotifier.new);
    injector.commit();
  },
);
