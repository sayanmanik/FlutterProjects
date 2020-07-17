import 'dart:io';

import 'package:device_project/models/place.dart';
import 'package:flutter/foundation.dart';


// class GreatPlaces with ChangeNotifier{
//   List<Place> _items = [];

//   List<Place> get items{
//     return [...items];
//   }

//   void addPlace(String pickedTitle, File pickedImage){
//     final newPlace = Place(
//       id: DateTime.now().toString(),
//       image: pickedImage,
//       title: pickedTitle,
//       location: null);

//       _items.add(newPlace);
//       notifyListeners();
//   }
// }



class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void addPlace(
    String pickedTitle,
    File pickedImage,
  ) {
    final newPlace = Place(
      id: DateTime.now().toString(),
      image: pickedImage,
      title: pickedTitle,
      location: null,
    );
    _items.add(newPlace);
    notifyListeners();
  }
}
