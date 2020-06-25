import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:meals_app/categories_screen.dart';
import 'package:meals_app/category_meals_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Deli Meals',
      theme: ThemeData( 
      primarySwatch: Colors.pink,
      accentColor: Colors.amber,
      canvasColor: Color.fromRGBO(255, 254, 229, 1),
      fontFamily: 'Railway',
      textTheme: ThemeData.light().textTheme.copyWith(
        body1 : TextStyle(
          color: Color.fromRGBO(20, 51, 51, 1),
        ),
        body2: TextStyle(
          color: Color.fromRGBO(20, 51, 51, 1)
        ),
        title: TextStyle(
          fontSize: 24,
          fontFamily: 'RobotoCondensed',
        )
      )
      ),
      home: CategoriesScreen(),
      routes: {
        '/category-meals':(ctx)=>CategoryMealsScreen(),
      },
      //home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('DeliMeals')
        ),

        body: Center(child: Text('Navigation Time'),),
      );
  }
}
