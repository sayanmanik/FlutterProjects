//import 'package:flutter/material.dart';
//
//class NewTransaction extends StatelessWidget {
//  Function transaction_handler;
//
//  final titleController = TextEditingController();
//  final amtController = TextEditingController();
//
//  NewTransaction(this.transaction_handler);
//
//  void submitData() {
//    final enteredTitle = titleController.text;
//    final enteredAmount = double.parse(amtController.text);
//
//    print('entered title $enteredTitle');
//    print('entered amount $enteredAmount');
//
//    if (enteredTitle.isEmpty || enteredAmount <= 0) {
//      return;
//    }
//
//    transaction_handler(enteredTitle, enteredAmount);
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      child: Card(
//          elevation: 5,
//          child: Container(
//            padding: EdgeInsets.all(5),
//            child: Column(
//              crossAxisAlignment: CrossAxisAlignment.end,
//              children: [
//                TextField(
//                  decoration: InputDecoration(labelText: 'Title'),
//                  controller: titleController,
//                  onSubmitted: (_) => submitData,
//                ),
//                TextField(
//                  decoration: InputDecoration(labelText: 'Amount'),
//                  controller: amtController,
//                  keyboardType: TextInputType.number,
//                  onSubmitted: (_) => submitData,
//                ),
//                FlatButton(
//                  child: Text('Add an item'),
//                  textColor: Colors.purple,
//                  onPressed: ()  => submitData,
//                )
//              ],
//            ),
//          )),
//    );
//  }
//}

// import 'package:flutter/material.dart';

// class NewTransaction extends StatelessWidget {
//   final Function addTx;
//   final titleController = TextEditingController();
//   final amountController = TextEditingController();

//   NewTransaction(this.addTx);

//   void submitData() {
//     final enteredTitle = titleController.text;
//     final enteredAmount = double.parse(amountController.text);

//     print("Title: ${enteredTitle}");
//     print("Amount: ${enteredAmount}");

//     if (enteredTitle.isEmpty || enteredAmount <= 0) {
//       return;
//     }

//     addTx(
//       enteredTitle,
//       enteredAmount,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 5,
//       child: Container(
//         padding: EdgeInsets.all(10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: <Widget>[
//             TextField(
//               decoration: InputDecoration(labelText: 'Title'),
//               controller: titleController,
//               onSubmitted: (_) => submitData(),
//               // onChanged: (val) {
//               //   titleInput = val;
//               // },
//             ),
//             TextField(
//               decoration: InputDecoration(labelText: 'Amount'),
//               controller: amountController,
//               keyboardType: TextInputType.number,
//               onSubmitted: (_) => submitData(),
//               // onChanged: (val) => amountInput = val,
//             ),
//             FlatButton(
//               child: Text('Add Transaction'),
//               textColor: Colors.purple,
//               onPressed: submitData,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<StatefulWidget> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _dateTime;

  void submitData() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _dateTime == null) {
      return;
    }

    widget.addTx(
      enteredTitle,
      enteredAmount,
      _dateTime
    );

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        _dateTime = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: _titleController,
              onSubmitted: (_) => submitData(),
              // onChanged: (val) {
              //   titleInput = val;
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: _amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
              // onChanged: (val) => amountInput = val,
            ),
            Container(
                height: 100,
                child: Row(children: [
                  Expanded(
                      child: Text(_dateTime == null
                          ? 'No Date'
                          : 'Picked Date: ${DateFormat.yMMMMd().format(_dateTime)}'
                          )
                        ),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    child: Text(
                      'Add Date',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: _presentDatePicker,
                  ),
                ])),
            RaisedButton(
              child: Text('Add Transaction'),
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).textTheme.button.color,
              onPressed: submitData,
            ),
          ],
        ),
      ),
    );
  }
}
