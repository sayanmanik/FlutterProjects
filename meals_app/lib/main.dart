import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meal_details_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';

import 'models/meal.dart';
import 'screens/categories_screen.dart';
import 'screens/category_meals_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoritesList = [];


  void _setFilters(Map<String, bool> filteredData) {
    setState(() {
      filters = filteredData;
    });

    _availableMeals = DUMMY_MEALS.where(
      (meal) {

        if(filters['gluten'] && !meal.isGlutenFree){
          return false;
        }
        if(filters['lactose'] && !meal.isLactoseFree){
          return false;
        }
        if(filters['vegan'] && !meal.isVegan){
          return false;
        }
         if(filters['vegetarian'] && !meal.isVegetarian){
          return false;
        }
      return true;
      }).toList();
     
  }


  void _toggleFavorite(String mealId){
    final existingIndex = _favoritesList.indexWhere((meal) {
        return meal.id == mealId;
    });

    if(existingIndex>=0){
      setState(() {
        _favoritesList.removeAt(existingIndex);
      });
    }else{
      setState(() {
        _favoritesList.add(DUMMY_MEALS.firstWhere((meal){
          return meal.id == mealId;
        } ));
      });
    }
  }

  bool _isMealFavorite(String id){
    return _favoritesList.any((meal) => meal.id == id);
  }

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
                body1: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                title: TextStyle(
                  fontSize: 24,
                  fontFamily: 'RobotoCondensed',
                ))),
        //home: CategoriesScreen(),
        routes: {
          '/': (ctx) => TabsScreen(_favoritesList),
          CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(_availableMeals),
          MealDetailsScreen.routeName: (ctx) => MealDetailsScreen(_toggleFavorite,_isMealFavorite),
          FiltersScreen.routeName: (ctx) => FiltersScreen(filters,_setFilters)
        },
        onGenerateRoute: (settings) {
          print(settings.arguments);
          return MaterialPageRoute(builder: (ctx) => MealDetailsScreen(_toggleFavorite,_isMealFavorite));
        },
        onUnknownRoute: (settings) {
          return MaterialPageRoute(builder: (ctx) => CategoryMealsScreen(_availableMeals));
        }
        //home: MyHomePage(title: 'Flutter Demo Home Page'),
        );
  }
}
