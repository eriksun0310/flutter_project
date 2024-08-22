import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  //TextEditingController:控制和管理TextField中的文本
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate; // 選擇的日期
  Category _selectedCategory = Category.leisure;

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  //送出一筆金額
  void _submitExpenseData() {
    // double.tryParse():string轉number
    final enteredAmount = double.tryParse(_amountController
        .text); // tryParse('Hello') => null、tryParse('12.11')=>12.11

    //amount驗證
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;

    //如果其中一項未填,則跳 提示訊息modal
    if (_titleController.text.trim().isEmpty ||
        amountIsInvalid ||
        _selectedDate == null) {
      //跳出 提示訊息modal
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: const Text('Invalid input'),
                content: const Text(
                    'Please make sure a valid title, amount, date and category was entered.'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(ctx); // 關閉 提示訊息modal
                      },
                      child: const Text('Okay'))
                ],
              ));
      return;
    }

    widget.onAddExpense(Expense(
        title: _titleController.text,
        amount: enteredAmount,
        date: _selectedDate!,
        category: _selectedCategory));

    //關閉 新增費用的modal
    Navigator.pop(context);
  }

  @override
  //dispose():是 Flutter 中的生命週期方法，當小部件被銷毀時會自動調用。
  void dispose() {
    _titleController.dispose(); // 釋放 _titleController 佔用的資源
    _amountController.dispose();
    super.dispose(); //調用父類的 dispose 方法
  }

  @override
  Widget build(context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;

    return LayoutBuilder(builder: (ctx, constraints) {
      final width = constraints.maxWidth;

      return SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, keyboardSpace + 16),
            child: Column(
              children: [
                // 橫向模式
                if (width >= 600)
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Expanded(
                      child: TextField(
                        controller: _titleController,
                        maxLength: 50,
                        decoration: InputDecoration(label: Text('Title')),
                      ),
                    ),
                    const SizedBox(width: 24),
                    Expanded(
                        child: TextField(
                      controller: _amountController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          prefix: Text('\$'), label: Text('Amount')),
                    )),
                  ])
                else
                  TextField(
                    controller: _titleController,
                    maxLength: 50,
                    decoration: InputDecoration(label: Text('Title')),
                  ),
                // 橫向模式
                if (width >= 600)
                  Row(
                    children: [
                      DropdownButton(
                          value: _selectedCategory, //顯示於dropdownBtn上的
                          items: Category.values
                              .map((category) => DropdownMenuItem(
                                  value: category,
                                  child: Text(category.name.toUpperCase())))
                              .toList(),
                          onChanged: (value) {
                            if (value == null) {
                              return;
                            }
                            setState(() {
                              _selectedCategory = value;
                            });
                          }),
                      const SizedBox(
                        width: 24,
                      ),
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(_selectedDate == null
                              ? 'No  date selected'
                              : formatter.format(_selectedDate!)),
                          IconButton(
                              onPressed: _presentDatePicker,
                              icon: const Icon(
                                Icons.calendar_month,
                              ))
                        ],
                      ))
                    ],
                  )
                else
                  Row(
                    children: [
                      Expanded(
                          child: TextField(
                        controller: _amountController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            prefix: Text('\$'), label: Text('Amount')),
                      )),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(_selectedDate == null
                              ? 'No  date selected'
                              : formatter.format(_selectedDate!)),
                          IconButton(
                              onPressed: _presentDatePicker,
                              icon: const Icon(
                                Icons.calendar_month,
                              ))
                        ],
                      ))
                    ],
                  ),
                const SizedBox(
                  height: 16,
                ),
                if (width >= 600)
                  Row(
                    children: [
                      const Spacer(),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('cancel')),
                      ElevatedButton(
                          onPressed: _submitExpenseData,
                          child: const Text('save expense'))
                    ],
                  )
                else
                  Row(
                    children: [
                      DropdownButton(
                          value: _selectedCategory, //顯示於dropdownBtn上的
                          items: Category.values
                              .map((category) => DropdownMenuItem(
                                  value: category,
                                  child: Text(category.name.toUpperCase())))
                              .toList(),
                          onChanged: (value) {
                            if (value == null) {
                              return;
                            }
                            setState(() {
                              _selectedCategory = value;
                            });
                          }),
                      const Spacer(),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('cancel')),
                      ElevatedButton(
                          onPressed: _submitExpenseData,
                          child: const Text('save expense'))
                    ],
                  )
              ],
            ),
          ),
        ),
      );
    });
  }
}
