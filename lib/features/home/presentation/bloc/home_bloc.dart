import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/app_exception.dart';
import '../../../../core/error/result.dart';
import '../../domain/entities/plant_category.dart';
import '../../domain/entities/question.dart';
import '../../domain/repositories/home_repository.dart';

part 'home_bloc.freezed.dart';
part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this._repository) : super(const HomeState()) {
    on<HomeStarted>(_onLoadRequested);
    on<HomeRefreshed>(_onLoadRequested);
    on<HomeSearchChanged>(_onSearchChanged);
  }

  final HomeRepository _repository;

  Future<void> _onLoadRequested(HomeEvent event, Emitter<HomeState> emit) async {
    if (state.isLoading) {
      return;
    }

    emit(state.copyWith(status: HomeStatus.loading, error: null));

    final categoriesRequest = _repository.getCategories();
    final questionsRequest = _repository.getQuestions();

    final categories = await categoriesRequest;
    final questions = await questionsRequest;

    switch ((categories, questions)) {
      case (Success(value: final loadedCategories), Success(value: final loadedQuestions)):
        emit(
          state.copyWith(
            status: HomeStatus.success,
            categories: loadedCategories,
            questions: loadedQuestions,
          ),
        );
      case (Failure(exception: final exception), _) ||
          (_, Failure(exception: final exception)):
        emit(state.copyWith(status: HomeStatus.failure, error: exception));
    }
  }

  void _onSearchChanged(HomeSearchChanged event, Emitter<HomeState> emit) {
    emit(state.copyWith(query: event.query));
  }
}
