// import 'package:device_project/providers/great_places.dart';
// import 'package:device_project/screens/add_place_screen.dart';
// import 'package:device_project/screens/places_list_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// void main() {   
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider.value(
//         value: GreatPlaces(),
//         child: MaterialApp(
//             title: 'Great Places',
//             theme: ThemeData(
//               primarySwatch: Colors.blue,
//               accentColor: Colors.amber,
//               visualDensity: VisualDensity.adaptivePlatformDensity,
//             ),
//             home: PlacesListScreen(),
//             routes: {
//               AddPlaceScreen.routeName:(ctx) => AddPlaceScreen(),
              
//             },
//             )
//           );
//   }
// }




import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/great_places.dart';
import './screens/places_list_screen.dart';
import './screens/add_place_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GreatPlaces(),
      child: MaterialApp(
          title: 'Great Places',
          theme: ThemeData(
            primarySwatch: Colors.indigo,
            accentColor: Colors.amber,
          ),
          home: PlacesListScreen(),
          routes: {
            AddPlaceScreen.routeName: (ctx) => AddPlaceScreen(),
          }),
    );
  }
}
