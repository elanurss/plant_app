part of 'home_bloc.dart';

enum HomeStatus { initial, loading, success, failure }

@freezed
abstract class HomeState with _$HomeState {
  const HomeState._();

  const factory HomeState({
    @Default(HomeStatus.initial) HomeStatus status,
    @Default(<PlantCategory>[]) List<PlantCategory> categories,
    @Default(<Question>[]) List<Question> questions,
    @Default('') String query,
    AppException? error,
  }) = _HomeState;

  bool get isLoading => status == HomeStatus.loading;

  bool get hasFailed => status == HomeStatus.failure;

  List<PlantCategory> get visibleCategories {
    if (query.isEmpty) {
      return categories;
    }

    final needle = query.toLowerCase();
    return categories
        .where((category) => category.title.toLowerCase().contains(needle))
        .toList(growable: false);
  }
}
