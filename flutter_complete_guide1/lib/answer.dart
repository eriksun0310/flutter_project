import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String answerText;
  Answer(this.selectHandler, this.answerText, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white, // 設置btn文字顏色
            backgroundColor: Colors.blue // 設置btn背景顏色
            ),
        onPressed: selectHandler, // 使用命名參數提高可讀性
        child: Text(answerText),
      ),
    );
  }
}
