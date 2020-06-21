import 'package:flutter/material.dart';


class TextController extends StatelessWidget {

  final Function button_handler;

  TextController(this.button_handler);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        color: Colors.green,
        textColor: Colors.white,
        child: Text('Click here!'),
        onPressed: this.button_handler,
      ),
    );
  }
}