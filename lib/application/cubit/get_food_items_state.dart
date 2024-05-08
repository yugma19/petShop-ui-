part of 'get_food_items_cubit.dart';

@freezed
class GetFoodItemsState with _$GetFoodItemsState {
  const factory GetFoodItemsState(
      {required bool isLoading,
      required bool isSuccess,
      required bool isFailure,
      required String error,
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
      foodRepository: IFoodRepository(appUrl: appUrl),
      food: [],
      appStateNotifier: appStateNotifier,
    );
  }
}
