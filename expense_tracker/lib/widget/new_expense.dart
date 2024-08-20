import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  //TextEditingController:控制和管理TextField中的文本
  final _titleController = TextEditingController();

  @override
  //dispose():是 Flutter 中的生命週期方法，當小部件被銷毀時會自動調用。
  void dispose() {
    _titleController.dispose(); // 釋放 _titleController 佔用的資源
    super.dispose(); //調用父類的 dispose 方法
  }

  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: InputDecoration(label: Text('Title')),
          ),
          Row(
            children: [
              ElevatedButton(
                  onPressed: () {
                    print(_titleController.text);
                  },
                  child: const Text('Save expense'))
            ],
          )
        ],
      ),
    );
  }
}
