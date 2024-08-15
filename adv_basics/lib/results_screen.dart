import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  @override
  Widget build(context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('You answered'),
            SizedBox(height: 30),
            Text('List of answers'),
            SizedBox(height: 30),
            TextButton(onPressed: () {}, child: Text('Restart Quiz!'))
          ],
        ),
      ),
    );
  }
}
