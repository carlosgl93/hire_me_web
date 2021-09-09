import 'package:flutter/material.dart';

import '../../models/meals/dummy_data.dart';
import 'package:hire_me/widgets/sharedWidgets/myMaterialScaffold.dart';

class MealDetails extends StatelessWidget {
  static const routeName = '/mealDetails';
  const MealDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      // appBar title for MyMaterialScaffold
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            // recipe top image
            Container(
              height: mq.size.height * 0.33,
              width: mq.size.width * 1,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            // ingredientes Title
            buildSectionTitle(mq, context, 'Ingredients'),
            // ingredients list
            buildContainer(
              mq,
              context,
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: Text(selectedMeal.ingredients[index]),
                  ),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            // Steps to cook the recipe
            buildSectionTitle(mq, context, 'Steps'),
            buildContainer(
                mq,
                context,
                ListView.builder(
                  itemBuilder: (ctx, index) => Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text(
                            '#${(index + 1)}',
                          ),
                        ),
                        title: Text(selectedMeal.steps[index]),
                      ),
                      Divider()
                    ],
                  ),
                  itemCount: selectedMeal.steps.length,
                )),
          ],
        ),
      ),
    );
  }

  Container buildSectionTitle(MediaQueryData mq, BuildContext context, text) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: mq.size.height * 0.035,
      ),
      child: Text(text, style: Theme.of(context).textTheme.headline2),
    );
  }

  Container buildContainer(MediaQueryData mq, BuildContext context, child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      height: mq.size.height * 0.25,
      width: mq.size.width * 0.9,
      child: child,
    );
  }
}
