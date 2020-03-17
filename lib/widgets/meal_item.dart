import 'package:flutter/material.dart';
import 'package:meals_app/models/meals.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String title;
  final String id;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
  });

  String get complexityText {
    switch (complexity) {
      case Complexity.simple:
        return "Simple";
        break;
      case Complexity.hard:
        return "Hard";
        break;
      case Complexity.challenging:
        return "Challenging";
        break;
      default:
        return "Unknown";
        break;
    }
  }

  String get affordabilityText{
    switch(affordability)
    {
      case Affordability.affordable:
        return "Affordable";
        break;
      case Affordability.luxurious:
        return "Expensive";
        break;
      case Affordability.pricey:
        return "Pricey";
        break;
      default: return "Unknown";
        break;
    }
  }

  void selectedMeal(BuildContext context) {
    Navigator.pushNamed(context, MealDetailScreen.id, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:() => selectedMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20.0,
                  right: 10.0,
                  child: Container(
                    width: 350,
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    color: Colors.black54,
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 6,
                      ),
                      Text("$duration min"),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.work),
                      SizedBox(
                        width: 6,
                      ),
                      Text(complexityText),
                    ],
                  ),
                  Row(
                   children: <Widget>[
                     Icon(Icons.attach_money),
                     SizedBox(width: 6,),
                     Text(affordabilityText),
                   ], 
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
