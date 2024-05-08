import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_shop_ui/application/addFood/add_food_cubit.dart';
import 'package:pet_shop_ui/domain/core/configs/app_config.dart';
import 'package:pet_shop_ui/domain/core/configs/injection.dart';
import 'package:pet_shop_ui/presentation/util/my_button.dart';
import 'package:provider/provider.dart';

class AddFoodDialog extends StatelessWidget {
  const AddFoodDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final AppStateNotifier appStateNotifier =
        Provider.of<AppStateNotifier>(context);
    final appUrl = AppConfig.of(context)!.serverUrl;
    return BlocProvider(
      create: (context) {
        return AddFoodCubit(AddFoodState.initial(
            appStateNotifier: appStateNotifier, appUrl: appUrl));
      },
      child: const AddFoodDialogConsumer(),
    );
  }
}

class AddFoodDialogConsumer extends StatelessWidget {
  const AddFoodDialogConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddFoodCubit, AddFoodState>(
      listener: (context, state) {
        if (state.isSuccess) {
          Navigator.of(context).pop();
        }
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
                  'ADD NEW FOOD ITEM',
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
                          context.read<AddFoodCubit>().addFoodItem();
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
