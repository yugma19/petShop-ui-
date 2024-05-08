import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_shop_ui/presentation/util/dialogBox.dart';
import 'package:provider/provider.dart';

import '../../application/cubit/get_food_items_cubit.dart';
import '../../domain/core/configs/app_config.dart';
import '../util/todo_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final AppStateNotifier appStateNotifier =
        Provider.of<AppStateNotifier>(context);
    final appUrl = AppConfig.of(context)!.serverUrl;

    return BlocProvider(
      create: (context) {
        return GetFoodItemsCubit(GetFoodItemsState.initial(
            appStateNotifier: appStateNotifier, appUrl: appUrl))
          ..init();
      },
      child: const HomePageConsumer(),
    );
  }
}

class HomePageConsumer extends StatelessWidget {
  const HomePageConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();
    return BlocConsumer<GetFoodItemsCubit, GetFoodItemsState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.blue[200],
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: const Center(
                child: Text(
                  'PET FOOD STORE',
                ),
              ),
              elevation: 0,
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.blue,
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return DialogBox(
                        controller: name,
                        onSave: () {},
                        onCancel: () => Navigator.of(context).pop(),
                      );
                    });
              },
              child: const Icon(
                Icons.add,
              ),
            ),
            body: state.isLoading
                ? const CircularProgressIndicator()
                : ListView.builder(
                    itemCount: 10,
                    itemBuilder: ((context, index) {
                      // final foodItem = state.food[index];
                      return ToDoTile(
                        editFunction: () {},
                        foodName: 'rice',
                        deleteFunction: () {},
                      );
                    }),
                  ),
          );
        });
  }
}
