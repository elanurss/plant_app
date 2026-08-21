import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plant_app/core/error/app_exception.dart';
import 'package:plant_app/core/error/result.dart';
import 'package:plant_app/features/home/domain/entities/plant_category.dart';
import 'package:plant_app/features/home/domain/entities/question.dart';
import 'package:plant_app/features/home/domain/repositories/home_repository.dart';
import 'package:plant_app/features/home/presentation/bloc/home_bloc.dart';

class _MockHomeRepository extends Mock implements HomeRepository {}

const _categories = [
  PlantCategory(id: 1, title: 'Ferns', imageUrl: '', rank: 0),
];

const _questions = [
  Question(
    id: 1,
    title: 'How to identify plants?',
    subtitle: 'Life Style',
    imageUrl: '',
    url: '',
    order: 1,
  ),
];

void main() {
  late _MockHomeRepository repository;

  setUp(() => repository = _MockHomeRepository());

  blocTest<HomeBloc, HomeState>(
    'emits loading then success when both requests resolve',
    setUp: () {
      when(repository.getCategories)
          .thenAnswer((_) async => const Success(_categories));
      when(repository.getQuestions)
          .thenAnswer((_) async => const Success(_questions));
    },
    build: () => HomeBloc(repository),
    act: (bloc) => bloc.add(const HomeStarted()),
    expect: () => const [
      HomeState(status: HomeStatus.loading),
      HomeState(
        status: HomeStatus.success,
        categories: _categories,
        questions: _questions,
      ),
    ],
  );

  blocTest<HomeBloc, HomeState>(
    'fails the whole load when one request fails',
    setUp: () {
      when(repository.getCategories)
          .thenAnswer((_) async => const Success(_categories));
      when(repository.getQuestions)
          .thenAnswer((_) async => const Failure(RequestTimeoutException()));
    },
    build: () => HomeBloc(repository),
    act: (bloc) => bloc.add(const HomeStarted()),
    skip: 1,
    expect: () => [
      isA<HomeState>()
          .having((state) => state.hasFailed, 'hasFailed', isTrue)
          .having(
            (state) => state.error,
            'error',
            isA<RequestTimeoutException>(),
          ),
    ],
  );
}
