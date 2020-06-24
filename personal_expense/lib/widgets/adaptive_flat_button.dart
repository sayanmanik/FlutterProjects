import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

class AdaptiveFlatButton extends StatelessWidget {
  Function _presentDatePicker;
  String text;

  AdaptiveFlatButton(this.text, this._presentDatePicker);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Platform.isIOS
          ? CupertinoButton(
              child: Text(
                'Add Date',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onPressed: _presentDatePicker,
            )
          : FlatButton(
              textColor: Theme.of(context).primaryColor,
              child: Text(
                'Add Date',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onPressed: _presentDatePicker,
            ),
    );
  }
}
