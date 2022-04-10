import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/question.dart';

import 'answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final VoidCallback callback;

  Quiz(
      {required this.questions,
      required this.questionIndex,
      required this.callback});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        QuestionText(questions[questionIndex]['questionText'].toString()),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((e) {
          return AnswerButton(callback, e['title'] as String);
        }).toList(),
      ],
    );
  }
}
