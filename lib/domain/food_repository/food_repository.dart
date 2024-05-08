import 'package:dartz/dartz.dart';
import 'package:pet_shop_ui/infrastructure/dto/get_food_items_dto.dart';

abstract class FoodRepository {
  Future<List<GetFoodItemsDto>> getFood();
  Future<Either<String, bool>> addNewFoodItem({
    required String foodName,
    required String productType,
    required String packageType,
    required String price,
  });
}
