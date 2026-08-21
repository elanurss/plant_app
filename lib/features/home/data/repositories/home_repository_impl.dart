import 'package:injectable/injectable.dart';

import '../../../../core/error/app_exception.dart';
import '../../../../core/error/result.dart';
import '../../domain/entities/plant_category.dart';
import '../../domain/entities/question.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_remote_data_source.dart';

@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  const HomeRepositoryImpl(this._remoteDataSource);

  final HomeRemoteDataSource _remoteDataSource;

  @override
  Future<Result<List<PlantCategory>>> getCategories() {
    return _guard(() async {
      final models = await _remoteDataSource.fetchCategories();
      final categories = models.map((model) => model.toEntity()).toList()
        ..sort((a, b) => a.rank.compareTo(b.rank));
      return categories;
    });
  }

  @override
  Future<Result<List<Question>>> getQuestions() {
    return _guard(() async {
      final models = await _remoteDataSource.fetchQuestions();
      final questions = models.map((model) => model.toEntity()).toList()
        ..sort((a, b) => a.order.compareTo(b.order));
      return questions;
    });
  }

  Future<Result<T>> _guard<T>(Future<T> Function() request) async {
    try {
      return Success(await request());
    } on AppException catch (exception) {
      return Failure(exception);
    }
  }
}
