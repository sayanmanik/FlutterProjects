import 'package:first_assignment/textController.dart';
import 'package:flutter/material.dart';

class TextData extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return TextDataApp();
  }

}

class TextDataApp extends State<TextData> {
  
  String changed_text='Assignment 1';

  void button_handler(){
    setState(() {
      changed_text = "Text Changed";
    });
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Center(
              child: Text(changed_text,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue
                  ))),
        ),
         TextController(button_handler)
      ],
    );
  }
}
