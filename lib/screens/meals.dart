import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_info.dart';
import 'package:meals_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen(
    this.mealsForCategory,
    this.categoryTitle, {
    Key? key,
    required this.toggleFavourite,
  }) : super(key: key);

  final List<Meal> mealsForCategory;
  final String categoryTitle;
  final Function toggleFavourite;

  _onSelectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return MealInfo(
            meal,
            toggleFavourite: toggleFavourite,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '🤷',
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          Text(
            'No meals for the Category yet!',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onBackground),
          ),
          Text(
            'Try another category!',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onBackground),
          )
        ],
      ),
    );

    if (mealsForCategory.isNotEmpty) {
      content = Container(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 10,
        ),
        child: ListView.builder(
          itemCount: mealsForCategory.length,
          itemBuilder: (ctx, index) => MealItem(
            mealsForCategory[index],
            onSelectMeal: _onSelectMeal,
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: content,
    );
  }
}
