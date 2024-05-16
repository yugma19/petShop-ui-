part of 'get_food_items_cubit.dart';

@freezed
class GetFoodItemsState with _$GetFoodItemsState {
  const factory GetFoodItemsState(
      {required bool isLoading,
      required bool isSuccess,
      required bool isFailure,
      required String error,
      required String message,
      required String deleteProducts,
      required String foodId,
      required TextEditingController foodName,
      required TextEditingController productType,
      required TextEditingController packageType,
      required TextEditingController price,
      required FoodRepository foodRepository,
      required List<GetFoodItemsDto> food,
      required AppStateNotifier appStateNotifier}) = _GetFoodItemsState;
  factory GetFoodItemsState.initial({
    required AppStateNotifier appStateNotifier,
    required String appUrl,
  }) {
    return GetFoodItemsState(
      isLoading: false,
      isSuccess: false,
      isFailure: false,
      error: '',
      message: '',
      deleteProducts: '',
      foodId: '',
      foodName: TextEditingController(),
      productType: TextEditingController(),
      packageType: TextEditingController(),
      price: TextEditingController(),
      foodRepository: IFoodRepository(appUrl: appUrl),
      food: [],
      appStateNotifier: appStateNotifier,
    );
  }
}
