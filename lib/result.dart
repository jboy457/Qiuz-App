import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final Function resetQuestion;

  Result({this.score, this.resetQuestion});

  String get resultPhrase {
    String resultText;
    if (score <= 5) {
      resultText = 'You are awesome and innnocent😊';
    } else if (score <= 10) {
      resultText = 'Pretty likable!😍';
    } else if (score <= 15) {
      resultText = 'You are .... so Strange!🤔';
    } else if (score <= 20) {
      resultText = 'Omo, system doesn\'t recognise you😏😝';
    } else {
      resultText = 'You are so bad!😏';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 38,
            ),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text('Retake Quiz'),
            textColor: Colors.blue,
            onPressed: resetQuestion,
          )
        ],
      ),
    );
  }
}
