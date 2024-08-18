import 'package:expense_tracker/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: 'flutter course',
        amount: 19.99,
        date: DateTime.now(),
        category: Category.work)
  ];

  @override
  Widget build(context) {
    return Scaffold(
      body: Column(children: [
        const Text('char'),
        //Expanded:自動調整大小以填充剩餘的空間
        Expanded(child: ExpensesList(expenses: _registeredExpenses))
      ]),
    );
  }
}
