import 'package:flutter/material.dart';

// 用 const 保證它永遠不會被重新分配
const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer(this.colors1, this.colors2, {super.key});

  const GradientContainer.purple({super.key})
      : colors1 = Colors.deepPurple,
        colors2 = Colors.indigo;

  final Color colors1;
  final Color colors2;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [colors1, colors2],
              begin: startAlignment,
              end: endAlignment)),
      child: Center(
        child: Image.asset('assets/images/dice-2.png'),
      ),
    );
  }
}


// class GradientContainer extends StatelessWidget {
//   const GradientContainer({super.key, required this.colors});

//   final List<Color> colors;

//   @override
//   Widget build(context) {
//     return Container(
//       decoration:  BoxDecoration(
//           gradient: LinearGradient(
//               colors: colors, begin: startAlignment, end: endAlignment)),
//       child: const Center(
//         child: StyledText('1111'),
//       ),
//     );
//   }
// }
