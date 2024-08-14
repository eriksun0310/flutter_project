import 'dart:math';
import 'package:flutter/material.dart';

final randomizer = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});
  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

//_下滑線:這個類私有的, 只能在此文件中使用
class _DiceRollerState extends State<DiceRoller> {
  var activeDiceImage = 'assets/images/dice-2.png';

  var currentDiceRoll = 2;

  void rollDice() {
    setState(() {
      //這樣寫的話,在每次執骰子時,會創建一個新的Random對象,然後用它生成一個隨機數
      // currentDiceRoll = Random().nextInt(6) + 1;

      // 重複使用同一個Random對象,在每次執骰子時,都會重複使用這個Random 對象
      currentDiceRoll = randomizer.nextInt(6) + 1;
    });
  }

  @override
  Widget build(content) {
    return Column(
      //※如果 column 的高度正好等於子widget的話, 不管設置mainAxisSize、mainAxisAlignment 哪個看起來效果都是一樣的
      //MainAxisSize.min:用於緊貼子widget,縮小自身高度
      mainAxisSize: MainAxisSize.min,
      //MainAxisAlignment.center:用於將子widget 在可用空間內垂直居中對齊
      // mainAxisAlignment:MainAxisAlignment.center ,
      children: [
        Image.asset(
          'assets/images/dice-$currentDiceRoll.png',
          width: 200,
        ),
        const SizedBox(
          height: 20,
        ),
        TextButton(
            onPressed: rollDice,
            style: TextButton.styleFrom(
                // padding: EdgeInsets.only(top: 20),
                foregroundColor: Colors.white,
                textStyle: const TextStyle(fontSize: 28)),
            child: const Text('Roll Dice'))
      ],
    );
  }
}
