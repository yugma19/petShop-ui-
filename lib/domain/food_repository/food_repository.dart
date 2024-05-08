import 'package:pet_shop_ui/infrastructure/dto/get_food_items_dto.dart';

abstract class FoodRepository {
  Future<List<GetFoodItemsDto>> getFood();
}
