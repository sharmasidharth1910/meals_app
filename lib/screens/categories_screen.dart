import 'package:flutter/material.dart';
import 'package:meals_app/widgets/category_item.dart';
import 'package:meals_app/data/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {

  static const id = "/categories-screen";

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(20.0),
        children: DUMMY_CATEGORIES.map((categoryData) {
          return CategoryItem(
            title: categoryData.title,
            id: categoryData.id,
            color: categoryData.color,
          );
        }).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 1.5,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
    );
  }
}
