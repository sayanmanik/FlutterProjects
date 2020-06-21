import 'dart:ffi';

class Transaction {
  String id;
  String title;
  double amt;
  DateTime date;

  Transaction(
    {this.id, 
    this.title, 
    this.amt, 
    this.date});
}
