// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_food_items_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetFoodItemsDtoImpl _$$GetFoodItemsDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$GetFoodItemsDtoImpl(
      foodId: json['foodId'] as String,
      foodName: json['foodName'] as String,
      productType: json['productType'] as String,
      packageType: json['packageType'] as String,
      price: json['price'] as String,
    );

Map<String, dynamic> _$$GetFoodItemsDtoImplToJson(
        _$GetFoodItemsDtoImpl instance) =>
    <String, dynamic>{
      'foodId': instance.foodId,
      'foodName': instance.foodName,
      'productType': instance.productType,
      'packageType': instance.packageType,
      'price': instance.price,
    };
