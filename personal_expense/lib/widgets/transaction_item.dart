import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expense/models/transaction.dart';

class TransactionItem extends StatefulWidget {
  final Transaction transaction;
  final Function deleteItem;

  TransactionItem(
      {Key key, @required this.transaction, @required this.deleteItem})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  
  Color _bgColor;
  
  @override
  void initState(){
    const availableColors = [
      Colors.red,
      Colors.purple,
      Colors.blue,
      Colors.green
    ];

    _bgColor = availableColors[Random().nextInt(4)];
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: _bgColor,
                  radius: 30,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: FittedBox(child: Text('\$${widget.transaction.amt}')),
                  )),
              title: Text(
                '${widget.transaction.title}',
                style: Theme.of(context).textTheme.title,
              ),
              subtitle: Text(DateFormat.yMMMMd().format(widget.transaction.date)),
              trailing: MediaQuery.of(context).size.width > 460
                  ? FlatButton.icon(
                      textColor: Theme.of(context).errorColor,
                      onPressed: () => widget.deleteItem(widget.transaction.id),
                      icon: Icon(Icons.delete),
                      label: Text('Delete'))
                  : IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                      onPressed: () {
                        widget.deleteItem(widget.transaction.id);
                      },
                    ),
            )));
  }
}
