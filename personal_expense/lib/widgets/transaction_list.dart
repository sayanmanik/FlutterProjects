//import 'package:flutter/material.dart';
//import 'package:intl/intl.dart';
//import 'package:personal_expense/models/transaction.dart';
//
//class TransactionList extends StatelessWidget {
//
//  List<Transaction> transactions;
//
//  TransactionList(this.transactions);
//
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      height: 300,
//      child: ListView(
//          children: transactions.map((tx) => Card(
//              elevation: 5,
//              child: Row(
//                children: [
//                  Container(
//                      margin:
//                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//                      decoration: BoxDecoration(
//                        border: Border.all(color: Colors.purple, width: 2),
//                      ),
//                      padding: EdgeInsets.all(10),
//                      child: Text(
//                        '\$${tx.amt}', // STRING INTERPOLATION
//                        style: TextStyle(color: Colors.purple, fontSize: 20),
//                      )),
//                  Column(
//                    crossAxisAlignment: CrossAxisAlignment.start,
//                    children: [
//                      Container(
//                          child: Text(
//                        tx.title,
//                        style: TextStyle(fontSize: 16, color: Colors.black),
//                      )),
//                      Container(
//                          child: Text(
//                        DateFormat().add_yMMMMd().format(tx.date),
//                        style: TextStyle(color: Colors.grey),
//                      ))
//                    ],
//                  )
//                ],
//              )
//            )
//          )
//          .toList(),
//      )
//  );
//  }
//}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 15,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).primaryColor,
                      width: 2,
                    ),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    '\$${transactions[index].amt.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      transactions[index].title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      DateFormat.yMMMd().format(transactions[index].date),
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}