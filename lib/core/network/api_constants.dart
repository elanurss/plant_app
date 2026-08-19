abstract final class ApiConstants {
  static const String baseUrl = 'https://dummy-api-jtg6bessta-ey.a.run.app';

  static const String categories = '/getCategories';
  static const String questions = '/getQuestions';

  static const Duration connectTimeout = Duration(seconds: 15);
  static const Duration receiveTimeout = Duration(seconds: 15);
}
