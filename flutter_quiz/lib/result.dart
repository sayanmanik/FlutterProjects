import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int result;
  final Function reset_handler;

  Result(this.reset_handler, this.result);

  String get resultText {
    String txt;
    if (result <= 10) {
      txt = 'Pretty innocent';
    } else if (result <= 20) {
      txt = 'Good one';
    } else if (result <= 30) {
      txt = 'Keep it up!!';
    } else {
      txt = 'You are strange';
    }
    return txt;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: [
      Text(resultText,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center),
      FlatButton(
          child: Text('Restart Quiz'),
          textColor: Colors.blue,
          onPressed: reset_handler)
    ]));
  }
}
