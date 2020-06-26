import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:meals_app/screens/meal_details_screen.dart';

import 'screens/categories_screen.dart';
import 'screens/category_meals_screen.dart';

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
      //home: CategoriesScreen(),
      routes: {
        '/':(ctx)=>CategoriesScreen(),
        CategoryMealsScreen.routeName:(ctx)=>CategoryMealsScreen(),
        MealDetailsScreen.routeName:(ctx)=>MealDetailsScreen()
      },

      onGenerateRoute: (settings) {
        print(settings.arguments);
        return MaterialPageRoute(
          builder: (ctx) => MealDetailsScreen()
        );
      },



      onUnknownRoute: (settings) {
          return MaterialPageRoute(
            builder: (ctx)=> CategoryMealsScreen()
          );
      }
      //home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

