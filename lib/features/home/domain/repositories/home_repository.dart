import '../../../../core/error/result.dart';
import '../entities/plant_category.dart';
import '../entities/question.dart';

abstract interface class HomeRepository {
  Future<Result<List<PlantCategory>>> getCategories();

  Future<Result<List<Question>>> getQuestions();
}
