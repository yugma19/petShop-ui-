import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_shop_ui/application/addFood/add_food_cubit.dart';
import 'package:pet_shop_ui/application/getFood/get_food_items_cubit.dart';
import 'package:pet_shop_ui/domain/core/configs/app_config.dart';
import 'package:pet_shop_ui/domain/core/configs/injection.dart';
import 'package:pet_shop_ui/domain/core/services/navigation_services/navigation_service.dart';
import 'package:pet_shop_ui/presentation/util/my_button.dart';
import 'package:provider/provider.dart';

class UpdateFoodDialog extends StatelessWidget {
  const UpdateFoodDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final AppStateNotifier appStateNotifier =
        Provider.of<AppStateNotifier>(context);
    final appUrl = AppConfig.of(context)!.serverUrl;
    return BlocProvider(
      create: (context) {
        return GetFoodItemsCubit(GetFoodItemsState.initial(
            appStateNotifier: appStateNotifier, appUrl: appUrl));
      },
      child: const  UpdateFoodDialogConsumer(),
    );
  }
}

class UpdateFoodDialogConsumer extends StatelessWidget {
  const  UpdateFoodDialogConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetFoodItemsCubit,  GetFoodItemsState>(
      listener: (context, state) {
        if (state.isSuccess) {
       navigator<NavigationService>().goBack(responseObject: true);        }
      },
      builder: (context, state) {
        return AlertDialog(
          backgroundColor: Colors.white,
          content: SizedBox(
            height: 450,
            width: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  'UPDATE FOOD ITEM',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                TextField(
                  controller: state.foodName,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Add a new item',
                  ),
                ),
                TextField(
                  controller: state.productType,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Product type',
                  ),
                ),
                TextField(
                  controller: state.packageType,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Package type',
                  ),
                ),
                TextField(
                  controller: state.price,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Price',
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MyButton(
                        text: 'Save',
                        onPressed: () {
                          context.read<GetFoodItemsCubit>().updateFood();
                        }),
                    MyButton(
                        text: 'Cancel',
                        onPressed: () {
                          Navigator.of(context).pop();
                        })
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
