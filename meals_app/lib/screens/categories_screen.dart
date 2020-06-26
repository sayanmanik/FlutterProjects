import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/widgets/category_item.dart';



class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deli Meals')
      ),
      body: GridView(
        padding: const EdgeInsets.all(25),
      children: DUMMY_CATEGORIES.map((catData) {
        return CategoryItem(catData.id,catData.title, catData.color);
      }).toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    )
  );
}
}