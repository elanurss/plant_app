part of 'home_bloc.dart';

sealed class HomeEvent {
  const HomeEvent();
}

final class HomeStarted extends HomeEvent {
  const HomeStarted();
}

final class HomeRefreshed extends HomeEvent {
  const HomeRefreshed();
}

final class HomeSearchChanged extends HomeEvent {
  const HomeSearchChanged(this.query);

  final String query;
}
