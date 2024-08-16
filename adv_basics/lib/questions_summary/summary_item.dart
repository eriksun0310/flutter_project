import 'package:adv_basics/questions_summary/question_identifier.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.itemData, {super.key});

  final Map<String, Object> itemData;

  @override
  Widget build(context) {
    final isCorrectAnswer = itemData['user_data'] == itemData['correct_answer'];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuestionIdentifier(
              isCorrectAnswer: isCorrectAnswer,
              questionIndex: itemData['question_index'] as int),
          const SizedBox(
            width: 20,
          ),
          // Expanded:防止Column 的寬度 超出Row的範圍
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                itemData['question'] as String,
                style: GoogleFonts.lato(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                itemData['user_answer'] as String,
                style:
                    GoogleFonts.lato(color: Color.fromARGB(255, 202, 171, 252)),
              ),
              Text(itemData['correct_answer'] as String,
                  style: GoogleFonts.lato(
                      color: Color.fromARGB(255, 181, 254, 246)))
            ],
          ))
        ],
      ),
    );
  }
}
