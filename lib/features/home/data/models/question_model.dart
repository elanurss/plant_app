import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/question.dart';

part 'question_model.freezed.dart';
part 'question_model.g.dart';

@freezed
abstract class QuestionModel with _$QuestionModel {
  const QuestionModel._();

  const factory QuestionModel({
    required int id,
    required String title,
    @Default('') String subtitle,
    @JsonKey(name: 'image_uri') @Default('') String imageUri,
    @Default('') String uri,
    @Default(0) int order,
  }) = _QuestionModel;

  factory QuestionModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionModelFromJson(json);

  Question toEntity() => Question(
    id: id,
    title: title,
    subtitle: subtitle,
    imageUrl: imageUri,
    url: uri,
    order: order,
  );
}
