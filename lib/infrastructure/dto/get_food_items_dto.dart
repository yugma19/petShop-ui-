// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_food_items_dto.freezed.dart';
part 'get_food_items_dto.g.dart';

@freezed
class GetFoodItemsDto with _$GetFoodItemsDto {
  const factory GetFoodItemsDto({
    @JsonKey(name: 'foodId') required String foodId,
    @JsonKey(name: 'foodName') required String foodName,
    @JsonKey(name: 'productType') required String productType,
    @JsonKey(name: 'packageType') required String packageType,
    @JsonKey(name: 'price') String? price,
  }) = _GetFoodItemsDto;

  factory GetFoodItemsDto.fromJson(Map<String, dynamic> json) =>
      _$GetFoodItemsDtoFromJson(json);
}
