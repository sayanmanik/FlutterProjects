import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';

import 'category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deli Meals')
      ),
      body: GridView(
      children: DUMMY_CATEGORIES.map((catData) {
        return CategoryItem(catData.title, catData.color);
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