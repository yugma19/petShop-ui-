import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ToDoTile extends StatelessWidget {
  final String foodName;

  VoidCallback deleteFunction;
  VoidCallback editFunction;

  ToDoTile({
    super.key,
    required this.foodName,
    required this.deleteFunction,
    required this.editFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0, left: 25.0, right: 25.0),
      child: Container(
        padding: const EdgeInsets.all(24.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            12,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              foodName,
            ),
            SizedBox(
              child: Row(
                children: [
                  IconButton(
                      onPressed: editFunction,
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.yellow,
                      )),
                  IconButton(
                      onPressed: editFunction,
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
