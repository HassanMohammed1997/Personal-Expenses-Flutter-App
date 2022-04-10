import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final VoidCallback selectHandler;
  final String answerText;

  AnswerButton(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(15),
      child: RaisedButton(
        onPressed: selectHandler,
        child: Text(answerText),
        color: Colors.cyan,
      ),
    );
  }
}
