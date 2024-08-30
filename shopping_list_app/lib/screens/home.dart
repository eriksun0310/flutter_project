import 'package:flutter/material.dart';
import 'package:shopping_list_app/widget/grocery_list.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hello'),
      ),
      body: GroceryList(),
    );
  }
}
