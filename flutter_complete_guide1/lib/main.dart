import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}
//_:前置下滑線, 用來表示私有性
class _MyAppState extends State<MyApp> {
  var questionIndex = 0;

  void answerQuestion() {
    if (questionIndex < 1) {
      setState(() {
        questionIndex = questionIndex + 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      'What\'s your favorite color?',
      'What\'s your favorite animal?'
    ];
    return Scaffold(
        appBar: AppBar(
          title: const Text('My First App'),
        ),
        body: Column(
          children: [
            Text(questions[questionIndex]),
            ElevatedButton(child: Text('Answer 1'), onPressed: answerQuestion),
            ElevatedButton(child: Text('Answer 2'), onPressed: answerQuestion),
            ElevatedButton(child: Text('Answer 3'), onPressed: answerQuestion),
          ],
        ));
  }
}
