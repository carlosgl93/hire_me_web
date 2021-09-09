import 'package:flutter/material.dart';
import 'package:hire_me/models/meals/meal.dart';
import 'package:hire_me/screens/meals/mealDetails.dart';

class MealItem extends StatelessWidget {
  final String? id;
  final String? title;
  final String? imageUrl;
  final int? duration;
  final Complexity? complexity;
  final Affordability? affordability;
  final Function? removeItem;

  MealItem({
    this.id,
    this.title,
    this.imageUrl,
    this.duration,
    this.complexity,
    this.affordability,
    this.removeItem,
  });

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
      case Complexity.Challenging:
        return 'Challenging';
      case Complexity.Hard:
        return 'Hard';
      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Pricey:
        return 'Pricey';
      case Affordability.Luxurious:
        return 'Luxurious';
      default:
        return 'Unknown';
    }
  }

  void selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
      MealDetails.routeName,
      arguments: id,
    )
        .then((result) {
      if (result != null) {
        removeItem!(result);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 4,
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: Image.network(
                      imageUrl as String,
                      height: mq.size.height * 0.4,
                      width: mq.size.width,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    right: mq.size.width * 0.01,
                    child: Container(
                      width: mq.size.width * 0.25,
                      color: Colors.black54,
                      padding: EdgeInsets.symmetric(
                        vertical: mq.size.height * 0.005,
                        horizontal: mq.size.width * 0.005,
                      ),
                      child: Text(
                        title as String,
                        style: TextStyle(
                          fontSize: mq.textScaleFactor * 18,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                        softWrap: true,
                        overflow: TextOverflow.clip,
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.schedule,
                        ),
                        SizedBox(
                          width: mq.size.width * 0.001,
                        ),
                        Text(
                          '$duration mins',
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.work,
                        ),
                        SizedBox(
                          width: mq.size.width * 0.001,
                        ),
                        Text(
                          complexityText,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.attach_money),
                        SizedBox(
                          width: mq.size.width * 0.001,
                        ),
                        Text(
                          affordabilityText,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
