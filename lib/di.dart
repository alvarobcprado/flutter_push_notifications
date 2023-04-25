import 'package:auto_injector/auto_injector.dart';
import 'package:flutter_push_notifications/app/pages/home/home_notifier.dart';
import 'package:flutter_push_notifications/app/repositories/firebase_notifications_repository.dart';

final autoInjector = AutoInjector(
  on: (injector) {
    injector.addLazySingleton(FirebaseNotificationsRepository.new);
    injector.add(HomeNotifier.new);
  },
);
