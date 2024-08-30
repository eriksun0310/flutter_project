import 'package:flutter/material.dart';
import 'package:shopping_list_app/data/dummy_items.dart';

class GroceryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Expanded(
          child: Column(
        children: [
          for (final groceryItem in groceryItems)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      '111',
                      style: TextStyle(
                          backgroundColor: groceryItem.category.color),
                    ),
                    const SizedBox(width: 20),
                    Text(groceryItem.name),
                  ],
                ),
                Text(groceryItem.quantity.toString()),
              ],
            )
        ],
      )),
    );
  }
}
