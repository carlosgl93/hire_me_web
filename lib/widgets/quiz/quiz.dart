import 'package:flutter/material.dart';
import 'package:hire_me/widgets/quiz/answer.dart';
import 'package:hire_me/widgets/quiz/question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz({
    required this.questions,
    required this.answerQuestion,
    required this.questionIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Question(questions[questionIndex]['questionText'].toString()),
          ...(questions[questionIndex]['answers'] as List).map((answer) {
            return Answer(
              answer['answer'],
              () => answerQuestion(answer['answer']),
            );
          }).toList()
        ],
      ),
    );
  }
}
