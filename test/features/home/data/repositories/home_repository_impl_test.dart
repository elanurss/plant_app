import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plant_app/core/error/app_exception.dart';
import 'package:plant_app/core/error/result.dart';
import 'package:plant_app/features/home/data/datasources/home_remote_data_source.dart';
import 'package:plant_app/features/home/data/models/category_model.dart';
import 'package:plant_app/features/home/data/repositories/home_repository_impl.dart';
import 'package:plant_app/features/home/domain/entities/plant_category.dart';

class _MockRemoteDataSource extends Mock implements HomeRemoteDataSource {}

void main() {
  late _MockRemoteDataSource dataSource;
  late HomeRepositoryImpl repository;

  setUp(() {
    dataSource = _MockRemoteDataSource();
    repository = HomeRepositoryImpl(dataSource);
  });

  test('sorts categories by rank and flattens the nested image', () async {
    when(dataSource.fetchCategories).thenAnswer(
      (_) async => const [
        CategoryModel(id: 1, name: 'tree', title: 'Trees', rank: 5),
        CategoryModel(
          id: 2,
          name: 'fern',
          title: 'Ferns',
          image: CategoryImageModel(url: 'https://cdn.test/fern.png'),
        ),
      ],
    );

    final result =
        await repository.getCategories() as Success<List<PlantCategory>>;

    expect(result.value.map((c) => c.title), ['Ferns', 'Trees']);
    expect(result.value.first.imageUrl, 'https://cdn.test/fern.png');
  });

  test('returns a failure instead of throwing', () async {
    when(dataSource.fetchCategories).thenThrow(const NoInternetException());

    final result = await repository.getCategories();

    expect(result, isA<Failure<List<PlantCategory>>>());
  });
}
