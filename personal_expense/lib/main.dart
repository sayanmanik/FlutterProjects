// import 'package:flutter/material.dart';
// import 'package:personal_expense/widgets/chart.dart';
// import 'package:personal_expense/widgets/new_transaction.dart';
// import 'package:personal_expense/widgets/transaction_list.dart';
// import 'models/transaction.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Personal Expense',
//       theme: ThemeData(
//           primarySwatch: Colors.purple,
//           accentColor: Colors.amber,
//           fontFamily: 'Quicksand',
//           textTheme: ThemeData.light().textTheme.copyWith(
//               title: TextStyle(
//                   fontFamily: 'OpenSans',
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold)),
//           appBarTheme: AppBarTheme(
//               textTheme: ThemeData.light().textTheme.copyWith(
//                   title: TextStyle(
//                       fontFamily: 'OpenSans',
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold)))),
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final List<Transaction> transactions = [
//     Transaction(id: 't1', title: 'New Shoes', amt: 69.99, date: DateTime.now()),
//     Transaction(
//         id: 't2', title: 'Weekly Groceries', amt: 72.59, date: DateTime.now())
//   ];

//   void add_Transaction(String txTitle, double txAmt) {
//     final newTx = Transaction(
//         title: txTitle,
//         amt: txAmt,
//         date: DateTime.now(),
//         id: DateTime.now().toString());

//     print("new_text_amt: ${newTx.amt} new_text_title: ${newTx.title}");
//     setState(() {
//       transactions.add(newTx);
//       print(" Transaction List: ${transactions}");
//     });
//   }

//   void startAddNewTransaction(BuildContext ctx) {
//     showModalBottomSheet(
//         context: ctx,
//         builder: (_) {
//           return NewTransaction(add_Transaction);
//         });
//   }

//   List<Transaction> get _recentTransactions {
//     return transactions.where((tx) {
//       return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
//     }).toList();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Expense'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.add),
//             onPressed: () {
//               startAddNewTransaction(context);
//             },
//           )
//         ],
//       ),
//       body: transactions.isEmpty
//           ? Center(
//               child: Column(
//               children: [
//                 Text(
//                   "No data found",
//                   textAlign: TextAlign.center,
//                   style: Theme.of(context).textTheme.title,
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Container(
//                     height: 20,
//                     child: Image.asset(
//                       'assets/images/waiting.png',
//                       fit: BoxFit.cover,
//                     ))
//               ],
//             ))
//           : Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 Chart(_recentTransactions),
//                 TransactionList(transactions)
//               ],
//             ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//       floatingActionButton: FloatingActionButton(
//           child: Icon(Icons.add),
//           onPressed: () {
//             startAddNewTransaction(context);
//           }),

//       // Center(child: Text('Widget playground')),
//     );
//   }
// }




import 'package:flutter/material.dart';

import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import './widgets/chart.dart';
import './models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.amber,
          fontFamily: 'Quicksand',
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
          appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                  title: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  button: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  )
                ),
          )),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // String titleInput;
  // String amountInput;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amt: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Weekly Groceries',
      amt: 16.53,
      date: DateTime.now(),
    ),
  ];

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
      title: txTitle,
      amt: txAmount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(_addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Personal Expenses',
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context),
          ),
        ],
      ),
      body: _userTransactions.isEmpty
          ? Center(
              child: Column(
              children: [
                Text(
                  "No data found",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    height: 20,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ))
              ],
            ))
          : Column(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Chart(_recentTransactions),
                TransactionList(_userTransactions)
              ],
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}