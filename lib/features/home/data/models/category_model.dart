import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/plant_category.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
abstract class CategoryImageModel with _$CategoryImageModel {
  const factory CategoryImageModel({
    required String url,
    int? width,
    int? height,
  }) = _CategoryImageModel;

  factory CategoryImageModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryImageModelFromJson(json);
}

@freezed
abstract class CategoryModel with _$CategoryModel {
  const CategoryModel._();

  const factory CategoryModel({
    required int id,
    required String name,
    required String title,
    @Default(0) int rank,
    CategoryImageModel? image,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  PlantCategory toEntity() => PlantCategory(
    id: id,
    title: title,
    imageUrl: image?.url ?? '',
    rank: rank,
  );
}
