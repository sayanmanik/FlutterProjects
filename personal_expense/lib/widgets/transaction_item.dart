import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expense/models/transaction.dart';

class TransactionItem extends StatelessWidget {
  final Transaction _transaction;
  final Function _deleteItem;

  TransactionItem(this._transaction, this._deleteItem);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            child: ListTile(
              leading: CircleAvatar(
                  radius: 30,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: FittedBox(child: Text('\$${_transaction.amt}')),
                  )),
              title: Text(
                '${_transaction.title}',
                style: Theme.of(context).textTheme.title,
              ),
              subtitle: Text(DateFormat.yMMMMd().format(_transaction.date)),
              trailing: MediaQuery.of(context).size.width > 460
                  ? FlatButton.icon(
                      textColor: Theme.of(context).errorColor,
                      onPressed: () => _deleteItem(_transaction.id),
                      icon: Icon(Icons.delete),
                      label: Text('Delete'))
                  : IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                      onPressed: () {
                        _deleteItem(_transaction.id);
                      },
                    ),
            )));
  }
}
