import 'dart:convert';

import 'package:pet_shop_ui/domain/core/constants/api_constants.dart';
import 'package:pet_shop_ui/domain/core/services/network_service/rest_service.dart';
import 'package:pet_shop_ui/domain/food_repository/food_repository.dart';
import 'package:pet_shop_ui/infrastructure/dto/get_food_items_dto.dart';

class IFoodRepository extends FoodRepository {
  final String appUrl;
  IFoodRepository({required this.appUrl});

  @override
  Future<List<GetFoodItemsDto>> getFood() async {
    try {
      final url = appUrl + APIConstants.getFood;

      final res = await RESTService.performGETRequest(
        httpUrl: url,
      );

      if (res.statusCode == 200) {
        final List<dynamic> foodData = jsonDecode(res.body)['data'];

        final List<GetFoodItemsDto> vendors =
            foodData.map((json) => GetFoodItemsDto.fromJson(json)).toList();
        return vendors;
      } else {
        throw Exception('unable to fetch');
      }
    } catch (e) {
      // print(e);
      throw Exception('Error: $e');
    }
  }
}
