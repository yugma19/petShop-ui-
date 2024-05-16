// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_food_items_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetFoodItemsDto _$GetFoodItemsDtoFromJson(Map<String, dynamic> json) {
  return _GetFoodItemsDto.fromJson(json);
}

/// @nodoc
mixin _$GetFoodItemsDto {
  @JsonKey(name: 'foodId')
  String get foodId => throw _privateConstructorUsedError;
  @JsonKey(name: 'foodName')
  String get foodName => throw _privateConstructorUsedError;
  @JsonKey(name: 'productType')
  String get productType => throw _privateConstructorUsedError;
  @JsonKey(name: 'packageType')
  String get packageType => throw _privateConstructorUsedError;
  @JsonKey(name: 'price')
  String get price => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetFoodItemsDtoCopyWith<GetFoodItemsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetFoodItemsDtoCopyWith<$Res> {
  factory $GetFoodItemsDtoCopyWith(
          GetFoodItemsDto value, $Res Function(GetFoodItemsDto) then) =
      _$GetFoodItemsDtoCopyWithImpl<$Res, GetFoodItemsDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'foodId') String foodId,
      @JsonKey(name: 'foodName') String foodName,
      @JsonKey(name: 'productType') String productType,
      @JsonKey(name: 'packageType') String packageType,
      @JsonKey(name: 'price') String price});
}

/// @nodoc
class _$GetFoodItemsDtoCopyWithImpl<$Res, $Val extends GetFoodItemsDto>
    implements $GetFoodItemsDtoCopyWith<$Res> {
  _$GetFoodItemsDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? foodId = null,
    Object? foodName = null,
    Object? productType = null,
    Object? packageType = null,
    Object? price = null,
  }) {
    return _then(_value.copyWith(
      foodId: null == foodId
          ? _value.foodId
          : foodId // ignore: cast_nullable_to_non_nullable
              as String,
      foodName: null == foodName
          ? _value.foodName
          : foodName // ignore: cast_nullable_to_non_nullable
              as String,
      productType: null == productType
          ? _value.productType
          : productType // ignore: cast_nullable_to_non_nullable
              as String,
      packageType: null == packageType
          ? _value.packageType
          : packageType // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetFoodItemsDtoImplCopyWith<$Res>
    implements $GetFoodItemsDtoCopyWith<$Res> {
  factory _$$GetFoodItemsDtoImplCopyWith(_$GetFoodItemsDtoImpl value,
          $Res Function(_$GetFoodItemsDtoImpl) then) =
      __$$GetFoodItemsDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'foodId') String foodId,
      @JsonKey(name: 'foodName') String foodName,
      @JsonKey(name: 'productType') String productType,
      @JsonKey(name: 'packageType') String packageType,
      @JsonKey(name: 'price') String price});
}

/// @nodoc
class __$$GetFoodItemsDtoImplCopyWithImpl<$Res>
    extends _$GetFoodItemsDtoCopyWithImpl<$Res, _$GetFoodItemsDtoImpl>
    implements _$$GetFoodItemsDtoImplCopyWith<$Res> {
  __$$GetFoodItemsDtoImplCopyWithImpl(
      _$GetFoodItemsDtoImpl _value, $Res Function(_$GetFoodItemsDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? foodId = null,
    Object? foodName = null,
    Object? productType = null,
    Object? packageType = null,
    Object? price = null,
  }) {
    return _then(_$GetFoodItemsDtoImpl(
      foodId: null == foodId
          ? _value.foodId
          : foodId // ignore: cast_nullable_to_non_nullable
              as String,
      foodName: null == foodName
          ? _value.foodName
          : foodName // ignore: cast_nullable_to_non_nullable
              as String,
      productType: null == productType
          ? _value.productType
          : productType // ignore: cast_nullable_to_non_nullable
              as String,
      packageType: null == packageType
          ? _value.packageType
          : packageType // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetFoodItemsDtoImpl implements _GetFoodItemsDto {
  const _$GetFoodItemsDtoImpl(
      {@JsonKey(name: 'foodId') required this.foodId,
      @JsonKey(name: 'foodName') required this.foodName,
      @JsonKey(name: 'productType') required this.productType,
      @JsonKey(name: 'packageType') required this.packageType,
      @JsonKey(name: 'price') required this.price});

  factory _$GetFoodItemsDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetFoodItemsDtoImplFromJson(json);

  @override
  @JsonKey(name: 'foodId')
  final String foodId;
  @override
  @JsonKey(name: 'foodName')
  final String foodName;
  @override
  @JsonKey(name: 'productType')
  final String productType;
  @override
  @JsonKey(name: 'packageType')
  final String packageType;
  @override
  @JsonKey(name: 'price')
  final String price;

  @override
  String toString() {
    return 'GetFoodItemsDto(foodId: $foodId, foodName: $foodName, productType: $productType, packageType: $packageType, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetFoodItemsDtoImpl &&
            (identical(other.foodId, foodId) || other.foodId == foodId) &&
            (identical(other.foodName, foodName) ||
                other.foodName == foodName) &&
            (identical(other.productType, productType) ||
                other.productType == productType) &&
            (identical(other.packageType, packageType) ||
                other.packageType == packageType) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, foodId, foodName, productType, packageType, price);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetFoodItemsDtoImplCopyWith<_$GetFoodItemsDtoImpl> get copyWith =>
      __$$GetFoodItemsDtoImplCopyWithImpl<_$GetFoodItemsDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetFoodItemsDtoImplToJson(
      this,
    );
  }
}

abstract class _GetFoodItemsDto implements GetFoodItemsDto {
  const factory _GetFoodItemsDto(
          {@JsonKey(name: 'foodId') required final String foodId,
          @JsonKey(name: 'foodName') required final String foodName,
          @JsonKey(name: 'productType') required final String productType,
          @JsonKey(name: 'packageType') required final String packageType,
          @JsonKey(name: 'price') required final String price}) =
      _$GetFoodItemsDtoImpl;

  factory _GetFoodItemsDto.fromJson(Map<String, dynamic> json) =
      _$GetFoodItemsDtoImpl.fromJson;

  @override
  @JsonKey(name: 'foodId')
  String get foodId;
  @override
  @JsonKey(name: 'foodName')
  String get foodName;
  @override
  @JsonKey(name: 'productType')
  String get productType;
  @override
  @JsonKey(name: 'packageType')
  String get packageType;
  @override
  @JsonKey(name: 'price')
  String get price;
  @override
  @JsonKey(ignore: true)
  _$$GetFoodItemsDtoImplCopyWith<_$GetFoodItemsDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
