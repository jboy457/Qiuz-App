import "package:flutter/material.dart";

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'question': 'What\'s your favorite color?',
      'answer': [
        {'text': 'Blue', 'score': 1},
        {'text': 'Green', 'score': 4},
        {'text': 'Yello', 'score': 7},
        {'text': 'Not listed', 'score': 6}
      ]
    },
    {
      'question': 'What\'s your favorite animal?',
      'answer': [
        {'text': 'Cat', 'score': 1},
        {'text': 'Dog', 'score': 2},
        {'text': 'Parrot', 'score': 3},
        {'text': 'Not listed', 'score': 7},
      ]
    },
    {
      'question': 'What\'s your favorite meat?',
      'answer': [
        {'text': 'Cow meat', 'score': 4},
        {'text': 'Goat meat', 'score': 5},
        {'text': 'Puk Meat', 'score': 2},
        {'text': 'Not listed', 'score': 9},
      ]
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuestion() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(score) {
    _totalScore += score;
    setState(() {
      _questionIndex += 1;
    });
  }

  @override
  Widget build(BuildContext ctx) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex,
              )
            : Result(
                score: _totalScore,
                resetQuestion: _resetQuestion,
              ),
      ),
    );
  }
}
