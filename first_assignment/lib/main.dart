import 'package:first_assignment/text.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(_MyAppState());
}

class _MyAppState extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          title: Text('Assignment 1')),
      body: TextData()

    )
    );  
  }

}
