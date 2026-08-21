import 'package:freezed_annotation/freezed_annotation.dart';

part 'question.freezed.dart';

@freezed
abstract class Question with _$Question {
  const factory Question({
    required int id,
    required String title,
    required String subtitle,
    required String imageUrl,
    required String url,
    required int order,
  }) = _Question;
}
