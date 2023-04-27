abstract class HomeState {
  const HomeState();
}

class Loading extends HomeState {
  const Loading();
}

class Loaded extends HomeState {
  const Loaded();
}

class HomeStateError extends HomeState {
  const HomeStateError();
}

abstract class HomeEvent {
  const HomeEvent();
}

class SetupNotificationListeners extends HomeEvent {
  const SetupNotificationListeners();
}
