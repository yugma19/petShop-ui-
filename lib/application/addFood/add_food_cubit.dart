import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pet_shop_ui/domain/core/configs/app_config.dart';
import 'package:pet_shop_ui/domain/food_repository/food_repository.dart';
import 'package:pet_shop_ui/infrastructure/dto/get_food_items_dto.dart';
import 'package:pet_shop_ui/infrastructure/food_repository/i_food_repository.dart';

part 'add_food_state.dart';
part 'add_food_cubit.freezed.dart';

class AddFoodCubit extends Cubit<AddFoodState> {
  AddFoodCubit(super.initialState);

  Future<void> addFoodItem() async {
    try {
      final foodName = state.foodName.text.trim();
      final productType = state.productType.text.trim();
      final packageType = state.packageType.text.trim();
      final price = state.price.text.trim();

      final result = await state.foodRepository.addNewFoodItem(
        foodName: foodName,
        productType: productType,
        packageType: packageType,
        price: price,
      );
      emit(state.copyWith(isLoading: true));
      result.fold(
          (l) => emit(state.copyWith(
              isSuccess: false, isFailure: true, isLoading: false)),
          (r) => emit(state.copyWith(
              isFailure: false, isSuccess: true, isLoading: false)));
    } catch (e) {
      emit(state.copyWith(
          isLoading: false, isFailure: true, error: 'Failed to add food item'));
    }
  }
}
