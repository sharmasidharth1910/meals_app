import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatelessWidget {

  static const id = "FiltersScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters Screen"),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text("Filters Screen"),
      ),
    );
  }
}
