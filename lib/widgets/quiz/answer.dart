import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String answer;
  final VoidCallback answerHandler;
  Answer(this.answer, this.answerHandler);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: EdgeInsets.all(5),
      child: ElevatedButton(
        child: Text(answer),
        onPressed: answerHandler,
      ),
    );
  }
}
