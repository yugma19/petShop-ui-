part of 'add_food_cubit.dart';

@freezed
class AddFoodState with _$AddFoodState {
  const factory AddFoodState(
      {required bool isLoading,
      required bool isSuccess,
      required bool isFailure,
      required String error,
      required FoodRepository foodRepository,
      List<GetFoodItemsDto>? foodDto,
      required TextEditingController foodName,
      required TextEditingController productType,
      required TextEditingController packageType,
      required TextEditingController price,
      required AppStateNotifier appStateNotifier}) = _AddFoodState;
  factory AddFoodState.initial({
    required AppStateNotifier appStateNotifier,
    required String appUrl,
  }) {
    return AddFoodState(
      isLoading: false,
      isSuccess: false,
      isFailure: false,
      error: '',
      foodRepository: IFoodRepository(appUrl: appUrl),
      foodName: TextEditingController(),
      productType: TextEditingController(),
      packageType: TextEditingController(),
      price: TextEditingController(),
      appStateNotifier: appStateNotifier,
    );
  }
}
