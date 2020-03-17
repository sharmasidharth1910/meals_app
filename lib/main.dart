import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';

import './screens/category_meals_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        accentColor: Colors.indigo,
        canvasColor: Colors.grey[100],
        fontFamily: "Raleway",
        textTheme: ThemeData.light().textTheme.copyWith(
          body1: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
            ),
          body2: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
            ),
            title: const TextStyle(
              fontSize: 20,
              fontFamily: "RobotoCondensed",
              fontWeight: FontWeight.bold,
            ),
        ),
      ),
      home: TabsScreen(),
      routes: {
        CategoriesScreen.id : (context) => CategoriesScreen(),
        CategoryMealsScreen.id :(context) => CategoryMealsScreen(),
        MealDetailScreen.id : (context) => MealDetailScreen(),
      },
    );
  }
}