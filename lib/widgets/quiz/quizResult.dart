import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final String result;
  final VoidCallback resetQuiz;

  Result(this.result, this.resetQuiz);

  String get resultPhrase {
    String? resultText;
    if (result == 'Website') {
      resultText = 'Just a website, simple and useful.\nLets get in touch!';
    } else if (result == 'Android App') {
      resultText =
          'Oh I see, you do not like Apple, me neither.\nLets get in touch!';
    } else if (result == 'iOS App') {
      resultText =
          'Oh I see, you do not like Android... your loss.\nJust kidding, lets get in touch!';
    } else {
      resultText = 'Wonderful, a 360° product, lets get in touch!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        SizedBox(
          height: 50,
        ),
        Text(
          resultPhrase,
          style: TextStyle(
            fontSize: 28,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 50,
        ),
        TextButton(
          child: Text(
            'Restart quiz',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: resetQuiz,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.red),
            padding: MaterialStateProperty.all(
              EdgeInsets.all(20),
            ),
          ),
        )
      ]),
    );
  }
}
