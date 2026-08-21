import 'package:freezed_annotation/freezed_annotation.dart';

part 'plant_category.freezed.dart';

@freezed
abstract class PlantCategory with _$PlantCategory {
  const factory PlantCategory({
    required int id,
    required String title,
    required String imageUrl,
    required int rank,
  }) = _PlantCategory;
}
