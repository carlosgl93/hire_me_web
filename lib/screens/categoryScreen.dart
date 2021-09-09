import 'package:flutter/material.dart';
import 'package:hire_me/widgets/meals/mealItem.dart';

import '../models/meals/dummy_data.dart';
import '../models/meals/meal.dart';
import 'package:hire_me/widgets/sharedWidgets/myMaterialScaffold.dart';

class CategoryScreen extends StatefulWidget {
  static const routeName = '/displayedMeals';

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  String? categoryTitle;
  List<Meal>? displayedMeals;
  var _loadedInitData = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if (_loadedInitData == false) {
      final route = ModalRoute.of(context);
      if (route == null) return;
      final routeArgs = route.settings.arguments as Map<String, String>;
      // ModalRoute.of(context).settings.arguments as Map<String, String>;
      // categoryTitle casted to avoid type error
      final categoryId = routeArgs['id'];
      final categoryTitle = routeArgs['title'] as String;
      final displayedMeals = DUMMY_MEALS.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
    }

    _loadedInitData = true;
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals!.removeWhere((meal) => mealId == meal.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MyMaterialScaffold(
      categoryTitle as String,
      SafeArea(
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: displayedMeals![index].id,
              title: displayedMeals![index].title,
              imageUrl: displayedMeals![index].imageUrl,
              duration: displayedMeals![index].duration,
              affordability: displayedMeals![index].affordability,
              complexity: displayedMeals![index].complexity,
              removeItem: _removeMeal,
            );
          },
          itemCount: displayedMeals!.length,
        ),
      ),
    );
  }
}
