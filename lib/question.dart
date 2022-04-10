import 'package:flutter/material.dart';

class QuestionText extends StatelessWidget {
  final String questionText;
  const QuestionText(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left: 10),
      child: Text(
        questionText,
        style: const TextStyle(fontSize: 30, color: Colors.amberAccent),
        textAlign: TextAlign.start,
      ),
    );
  }
}
