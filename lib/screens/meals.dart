import 'package:flutter/material.dart';
import 'package:meals_app/data/meals_data.dart';
import 'package:meals_app/models/category.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen(this.activeCategory, {Key? key}) : super(key: key);

  final Category activeCategory;

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

    final mealsForCategory = availableMeals
        .where(
          (meal) => meal.categories.contains(activeCategory.id),
        )
        .toList();

    if (mealsForCategory.isNotEmpty) {
      content = Container(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 10,
        ),
        child: ListView.builder(
          itemCount: mealsForCategory.length,
          itemBuilder: (ctx, index) => Text(mealsForCategory[index].title),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activeCategory.title),
      ),
      body: content,
    );
  }
}
