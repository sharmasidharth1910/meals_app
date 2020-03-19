import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/meals.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const id = "FiltersScreen";
  final Function _saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this._saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters["gluten"];
    _lactoseFree = widget.currentFilters["lactose"];
    _vegan = widget.currentFilters["vegan"];
    _vegetarian = widget.currentFilters["vegetarian"];
    super.initState();
  }

  List<Meal> availableMeals = DUMMY_MEALS;

  Widget _BuildSwitchListTile(String title, String subTitle, bool currentValue,
      Function updateValue) {
    return SwitchListTile(
        title: Text(title),
        value: currentValue,
        subtitle: Text(subTitle),
        onChanged: updateValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters Screen"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.save), onPressed: () {
            final selectedFilters = {
              "gluten": _glutenFree,
              "vegetarian": _vegetarian,
              "vegan": _vegan,
              "lactose": _lactoseFree,
            };
            widget._saveFilters(selectedFilters);
          },)
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust your meal selection",
              style: Theme
                  .of(context)
                  .textTheme
                  .title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _BuildSwitchListTile("Gluten Free",
                  "Only include gluten free meals", _glutenFree, (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },),
                _BuildSwitchListTile(
                  "Lactose Free", "Only includes lactose free meals",
                  _lactoseFree, (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                },),
                _BuildSwitchListTile(
                  "Vegetarian Food", "Only includes vegetarian meals",
                  _vegetarian, (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                },),
                _BuildSwitchListTile(
                  "Vegan Only", "Only includes vegan meals", _vegan, (
                    newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                },),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
