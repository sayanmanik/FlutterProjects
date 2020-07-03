import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final double price;
  final int qty;
  final String title;

  CartItem(
      {@required this.id,
      @required this.price,
      @required this.qty,
      @required this.title});
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items={};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount{
    return _items.length;
  }


  double get totalAmount{
    var total = 0.0;
    _items.forEach((key, value) { 
      total += value.price * value.qty;
    });
    return total;
  }

  void addItem(String productId, double price, String title) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (existingItem) => CartItem(
              id: existingItem.id,
              price: existingItem.price,
              qty: existingItem.qty + 1,
              title: existingItem.title));
    } else {
      _items.putIfAbsent(
          productId,
          () => CartItem(
              id: DateTime.now().toString(),
              title: title,
              price: price,
              qty: 1));
    }

    notifyListeners();
  }


  void removeItem(String productId){
      _items.remove(productId);
      notifyListeners();
  }
}