import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem(
      {@required this.title,
      @required this.imageUrl,
      @required this.duration,
      @required this.complexity,
      @required this.affordability});

  void selectMeal() {}


  String get complexityText{
    switch(complexity){
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      default:
        return 'Unknown';
    }
  }


  String get affordabilityText{
    switch(affordability){
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Luxurious:
        return 'Expensive';
        break;
      default:
        return 'Unknown';
    }
  }


  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: selectMeal,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 4,
          margin: EdgeInsets.all(15),
          child: Column(children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(imageUrl,
                      height: 250, width: double.infinity, fit: BoxFit.cover),
                ),
                Positioned(
                    bottom: 20,
                    right: 10,
                    width: 350,
                    child: Container(
                      color: Colors.black54,
                      child: Text(
                        title,
                        style: TextStyle(
                            fontSize: 26,
                            color: Colors.white,
                            fontFamily: 'RobotoCondensed'),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ))
              ],
            ),
            Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.schedule),
                        SizedBox(width: 6),
                        Text('$duration mins')
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.work),
                        SizedBox(width: 6),
                        Text('$complexityText')
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.attach_money),
                        SizedBox(width: 6),
                        Text('$affordabilityText')
                      ],
                    ),
                  ],
                ))
          ]),
        ));
  }
}
