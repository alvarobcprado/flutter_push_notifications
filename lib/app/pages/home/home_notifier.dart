import 'package:flutter_push_notifications/app/pages/home/home_state.dart';
import 'package:flutter_push_notifications/app/repositories/notifications_repository.dart';
import 'package:re_state_action/re_state_action.dart';

class HomeNotifier extends ReStateEvent<HomeState, HomeEvent> {
  HomeNotifier({required NotificationsRepository notificationsRepository})
      : _notificationsRepository = notificationsRepository,
        super(const Loading()) {
    on<SetupNotificationListeners>(_setupNotificationListeners);
  }

  final NotificationsRepository _notificationsRepository;

  Future<void> _setupNotificationListeners(
    SetupNotificationListeners event,
  ) async {
    await Future.wait(
      [
        _notificationsRepository.listenToBackgroundMessage(
          (message) async {
            print('Background message: $message');
          },
        ),
        _notificationsRepository.listenToForegroundMessage(
          (message) async {
            print('Foreground message: $message');
          },
        ),
        _notificationsRepository.handleInitialMessage(
          (message) async {
            print('Initial message: $message');
          },
        )
      ],
    );

    emitState(const Loaded());
  }
}
