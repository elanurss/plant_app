import 'package:injectable/injectable.dart';

import '../../../../core/error/app_exception.dart';
import '../../../../core/network/api_constants.dart';
import '../../../../core/network/dio_client.dart';
import '../models/category_model.dart';
import '../models/question_model.dart';

abstract interface class HomeRemoteDataSource {
  Future<List<CategoryModel>> fetchCategories();

  Future<List<QuestionModel>> fetchQuestions();
}

@LazySingleton(as: HomeRemoteDataSource)
class DioHomeRemoteDataSource implements HomeRemoteDataSource {
  const DioHomeRemoteDataSource(this._client);

  static const String _dataKey = 'data';

  final DioClient _client;

  @override
  Future<List<CategoryModel>> fetchCategories() async {
    final body = await _client.get(ApiConstants.categories);

    if (body is! Map<String, dynamic>) {
      throw const ParsingException('Expected an object at the root.');
    }

    return _parseList(body[_dataKey], CategoryModel.fromJson);
  }

  @override
  Future<List<QuestionModel>> fetchQuestions() async {
    final body = await _client.get(ApiConstants.questions);

    return _parseList(body, QuestionModel.fromJson);
  }

  List<T> _parseList<T>(
    Object? source,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    if (source is! List) {
      throw const ParsingException('Expected a list of items.');
    }

    try {
      return source
          .cast<Map<String, dynamic>>()
          .map(fromJson)
          .toList(growable: false);
    } on TypeError {
      throw const ParsingException('An item had an unexpected shape.');
    }
  }
}
