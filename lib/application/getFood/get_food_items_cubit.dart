import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pet_shop_ui/domain/core/configs/app_config.dart';
import 'package:pet_shop_ui/domain/food_repository/food_repository.dart';
import 'package:pet_shop_ui/infrastructure/dto/get_food_items_dto.dart';
import 'package:pet_shop_ui/infrastructure/food_repository/i_food_repository.dart';

part 'get_food_items_state.dart';
part 'get_food_items_cubit.freezed.dart';

class GetFoodItemsCubit extends Cubit<GetFoodItemsState> {
  GetFoodItemsCubit(super.initialState);

  void init() async {
    emit(state.copyWith(isLoading: true));
    try {
      List<GetFoodItemsDto> foodDto = await state.foodRepository.getFood();
      if (foodDto.isNotEmpty) {
        emit(state.copyWith(
          isLoading: false,
          isSuccess: true,
          food: foodDto,
        ));
      } else {
        emit(state.copyWith(
            isLoading: false,
            isSuccess: true,
            isFailure: false,
            error: 'No Details found'));
      }
    } catch (e) {
      emit(state.copyWith(
          isLoading: false, isFailure: true, error: 'Failed to load category'));
    }
  }

  void deleteFood({ required String foodId}) async {
  emit(state.copyWith(isLoading: true));
  try {
    final result = await state.foodRepository.deleteFood(foodId: foodId);
    result.fold(
      (error) {
        emit(state.copyWith(
          isLoading: false,
          isFailure: true,
          error: 'Failed to delete product: $error',
        ));
      },
      (success) {
        emit(state.copyWith(
          isLoading: false,
          isSuccess: true,
          message: 'Product deleted successfully',
        ));        
        init();
      },
    );
  } catch (e) {
    emit(state.copyWith(
      isLoading: false,
      isFailure: true,
      error: 'Failed to delete product: $e',
    ));
  }
}

void updateFood() async {
  // Retrieve values from text controllers
  final foodName = state.foodName.text.trim();
  final productType = state.productType.text.trim();
  final packageType = state.packageType.text.trim();
  final price = state.price.text.trim();
  // Extract foodId from the state
  final foodId = state.foodId;

  // Emit loading state
  emit(state.copyWith(isLoading: true));

  try {
    // Call the repository method to update food
    final result = await state.foodRepository.updateFood(
      foodId: foodId,
      foodName: foodName,
      productType: productType,
      packageType: packageType,
      price: price,
    );
    // Handle result
    result.fold(
      (error) {
        // Emit failure state with error message
        emit(state.copyWith(
          isLoading: false,
          isFailure: true,
          error: 'Failed to update product: $error',
        ));
      },
      (success) {
        // Emit success state with message
        emit(state.copyWith(
          isLoading: false,
          isSuccess: true,
          message: 'Product updated successfully',
        ));

        // Optionally, perform additional actions after successful update
        // For example, you can refresh the product list
        init();
      },
    );
  } catch (e) {
    // Emit failure state if an exception occurs
    emit(state.copyWith(
      isLoading: false,
      isFailure: true,
      error: 'Failed to update product: $e',
    ));
  }
}

  void emitFromAnywhere({required GetFoodItemsState state}) {
    emit(state);
  }
}
