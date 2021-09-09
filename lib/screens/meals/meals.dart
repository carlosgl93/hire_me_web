import 'package:flutter/material.dart';

import '../../models/meals/dummy_data.dart';
import 'package:hire_me/widgets/meals/categoryItem.dart';

class Meals extends StatefulWidget {
  const Meals({Key? key}) : super(key: key);

  @override
  _MealsState createState() => _MealsState();
}

class _MealsState extends State<Meals> {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 25,
          horizontal: 5,
        ),
        child: GridView(
          children: DUMMY_CATEGORIES
              .map(
                (category) => CategoryItem(
                  category.id,
                  category.title,
                  category.color,
                ),
              )
              .toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: mq.size.width * 0.5,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: mq.size.width * 0.02,
              mainAxisSpacing: mq.size.height * 0.02),
        ),
      ),
    );
  }
}
