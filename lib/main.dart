import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'models/meals.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';

import './screens/category_meals_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Map<String, bool> _filters = {
    "gluten": false,
    "vegetarian": false,
    "vegan": false,
    "lactose": false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters["gluten"] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters["lactose"] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters["vegan"] && !meal.isVegan) {
          return false;
        }
        if (_filters["vegetarian"] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

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
        TabsScreen.id: (context) => TabsScreen(),
        FiltersScreen.id: (context) => FiltersScreen(_filters, _setFilters),
        CategoriesScreen.id : (context) => CategoriesScreen(),
        CategoryMealsScreen.id: (context) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailScreen.id : (context) => MealDetailScreen(),
      },
    );
  }
}