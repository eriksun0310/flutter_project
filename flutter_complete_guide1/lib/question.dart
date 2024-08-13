import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  //final: 一旦賦值後就不能改變值
  final String questText;
  const Question(this.questText, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, //使container充滿 widget的寬度,文本才可以置中
      margin:const EdgeInsets.all(10),
      child: Text(
        questText,
        style: const  TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}
