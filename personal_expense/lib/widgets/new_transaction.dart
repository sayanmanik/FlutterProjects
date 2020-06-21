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

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<StatefulWidget> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addTx(
    enteredTitle,
      enteredAmount,
    );

    Navigator.of(context).pop();
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
              controller: titleController,
              onSubmitted: (_) => submitData(),
              // onChanged: (val) {
              //   titleInput = val;
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
              // onChanged: (val) => amountInput = val,
            ),
            FlatButton(
              child: Text('Add Transaction'),
              textColor: Colors.purple,
              onPressed: submitData,
            ),
          ],
        ),
      ),
    );
  }
}
