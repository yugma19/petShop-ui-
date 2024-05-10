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
        // Optionally, you can refresh the product list after deletion
        // Or you can let the UI handle the update
        // init();
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

  void emitFromAnywhere({required GetFoodItemsState state}) {
    emit(state);
  }
}
