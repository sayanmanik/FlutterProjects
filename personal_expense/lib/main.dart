import 'package:flutter/material.dart';
import 'package:personal_expense/widgets/new_transaction.dart';
import 'package:personal_expense/widgets/transaction_list.dart';
import 'models/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expense',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
          title: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 18,
            fontWeight: FontWeight.bold
          )
        ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 20,
                fontWeight: FontWeight.bold
              )
          )
        )
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> transactions = [
    Transaction(id: 't1', title: 'New Shoes', amt: 69.99, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'Weekly Groceries', amt: 72.59, date: DateTime.now())
  ];

  void add_Transaction(String txTitle, double txAmt) {
    final newTx = Transaction(
        title: txTitle,
        amt: txAmt,
        date: DateTime.now(),
        id: DateTime.now().toString());

    print("new_text_amt: ${newTx.amt} new_text_title: ${newTx.title}");
    setState(() {
      transactions.add(newTx);
      print(" Transaction List: ${transactions}");
    });
  }

  void startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTransaction(add_Transaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              startAddNewTransaction(context);
            },
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                child: Text('First'),
              )),
          TransactionList(transactions)
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            startAddNewTransaction(context);
          }),

      // Center(child: Text('Widget playground')),
    );
  }
}

// import 'package:flutter/material.dart';

// import './widgets/new_transaction.dart';
// import './widgets/transaction_list.dart';
// import './models/transaction.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter App',
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   // String titleInput;
//   // String amountInput;
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final List<Transaction> _userTransactions = [
//     Transaction(
//       id: 't1',
//       title: 'New Shoes',
//       amt: 69.99,
//       date: DateTime.now(),
//     ),
//     Transaction(
//       id: 't2',
//       title: 'Weekly Groceries',
//       amt: 16.53,
//       date: DateTime.now(),
//     ),
//   ];

//   void _addNewTransaction(String txTitle, double txAmount) {
//     final newTx = Transaction(
//       title: txTitle,
//       amt: txAmount,
//       date: DateTime.now(),
//       id: DateTime.now().toString(),
//     );

//     setState(() {
//       _userTransactions.add(newTx);
//     });
//   }

//   void _startAddNewTransaction(BuildContext ctx) {
//     showModalBottomSheet(
//       context: ctx,
//       builder: (_) {
//         return GestureDetector(
//           onTap: () {},
//           child: NewTransaction(_addNewTransaction),
//           behavior: HitTestBehavior.opaque,
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Flutter App'),
//         actions: <Widget>[
//           IconButton(
//             icon: Icon(Icons.add),
//             onPressed: () => _startAddNewTransaction(context),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           // mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             Container(
//               width: double.infinity,
//               child: Card(
//                 color: Colors.blue,
//                 child: Text('CHART!'),
//                 elevation: 5,
//               ),
//             ),
//             TransactionList(_userTransactions),
//           ],
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.add),
//         onPressed: () => _startAddNewTransaction(context),
//       ),
//     );
//   }
// }
