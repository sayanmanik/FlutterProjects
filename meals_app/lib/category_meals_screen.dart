import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  
  // final String id;
  // final String title;

  // CategoryMealsScreen(this.id,this.title);

  static const routeName = '/category-meals'; 
  
  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String,String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];


    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: Text(
          'The Recipes for Category'
          )
        )
    );
  }
}