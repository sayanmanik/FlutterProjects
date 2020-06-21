import 'package:flutter/material.dart';
import 'package:flutter_quiz/question.dart';

import 'answer.dart';

class Quiz extends StatelessWidget {
  final Function answerQuestion;
  final int questionIndex;
  final List questions;

  Quiz({this.answerQuestion, this.questionIndex, this.questions});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Question(questions[questionIndex]['questionText']),
      ...(questions[questionIndex]['answer'] as List)
          .map((answer) {
        return Answer(()=>answerQuestion(answer['score']), answer['text']);
      })
    ]);
  }
}
