import 'package:flutter/material.dart';
import 'package:flutter_quiz/result.dart';
import './question.dart';
import 'Quiz.dart';
import 'answer.dart';

void main() => runApp(_MyApp());

class _MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<_MyApp> {
// var questions = ['What\'s your favorite question?',
//                 'What\'s your favorite animal?'];

  var _questions = [
    {
      'questionText': 'What\'s your favourite animal?',
      'answer': [
        {'text': 'Dog', 'score': 10},
        {'text': 'Cat', 'score': 5},
        {'text': 'Elephant', 'score': 20}
      ]
    },
    {
      'questionText': 'Who\'s your favourite instructor?',
      'answer': [
        {'text': 'Sayan', 'score': 5},
        {'text': 'Sayan', 'score': 5},
        {'text': 'Sayan', 'score': 5}
      ]
    }
  ];

  var _index = 0;
  var _total_score = 0;

  void _answerQuestion(int score) {

    _total_score = _total_score + score;
    setState(() {
      _index = (_index + 1);
    });

    print("Answer chosen!");
  }


  void _resetQuestion(){

    setState(() {
      _index = 0;
      _total_score = 0;
    });

  }

  Widget build(BuildContext ctx) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("My First App"),
          ),
          body: _index < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _index,
                  questions: _questions)
              : Result(_resetQuestion,_total_score)),
    );
  }
}
