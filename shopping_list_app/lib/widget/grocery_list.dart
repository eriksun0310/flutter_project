import 'package:flutter/material.dart';
import 'package:shopping_list_app/data/dummy_items.dart';
import 'package:shopping_list_app/widget/new_item.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  void _addItem(context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => const NewItem()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [
          IconButton(
              onPressed: () {
                _addItem(context);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: ListView.builder(
          itemCount: groceryItems.length,
          itemBuilder: (ctx, index) => ListTile(
                //標題
                title: Text(groceryItems[index].name),
                //標題的前面
                leading: Container(
                  width: 24,
                  height: 24,
                  color: groceryItems[index].category.color,
                ),
                //標題的後面
                trailing: Text(groceryItems[index].quantity.toString()),
              )),
    );
  }
}


// Center(
//       child: Expanded(
//           child: Column(
//         children: [
//           for (final groceryItem in groceryItems)
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   children: [
//                     Text(
//                       '111',
//                       style: TextStyle(
//                           backgroundColor: groceryItem.category.color),
//                     ),
//                     const SizedBox(width: 20),
//                     Text(groceryItem.name),
//                   ],
//                 ),
//                 Text(groceryItem.quantity.toString()),
//               ],
//             )
//         ],
//       )),
//     )