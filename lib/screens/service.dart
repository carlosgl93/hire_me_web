import 'package:flutter/material.dart';
import 'package:hire_me/widgets/quiz/quiz.dart';
import 'package:hire_me/widgets/quiz/quizResult.dart';

class Solution extends StatefulWidget {
  const Solution({Key? key}) : super(key: key);

  @override
  _SolutionState createState() => _SolutionState();
}

class _SolutionState extends State<Solution> {
  final _questions = const [
    {
      'questionText': 'What do you need?',
      'answers': [
        {'key': '1', 'answer': 'Website'},
        {'key': '2', 'answer': 'Android App'},
        {'key': '3', 'answer': 'iOS App'},
        {'key': '4', 'answer': 'Website + App'},
      ],
    },
  ];
  var _questionIndex = 0;
  var solutionNeeded = '';

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      solutionNeeded = '';
    });
  }

  void _answerQuestion(answer) {
    if (_questionIndex < _questions.length) {
      solutionNeeded += '$answer';
      print(solutionNeeded);
      setState(() {
        _questionIndex = _questionIndex + 1;
      });
    } else {
      return print('Quiz finished');
    }

    print('question index $_questionIndex');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('¿Qué necesitas?'),
        centerTitle: true,
      ),
      body: _questionIndex < _questions.length
          ? Quiz(
              answerQuestion: _answerQuestion,
              questionIndex: _questionIndex,
              questions: _questions,
            )
          : Result(solutionNeeded, _resetQuiz),
    );
  }
}
