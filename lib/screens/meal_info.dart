import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealInfo extends StatelessWidget {
  const MealInfo(this.mealData, {super.key});
  final Meal mealData;

  @override
  build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          mealData.title,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              mealData.imageUrl,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 24),
            Text(
              'Ingredients',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 16),
            for (final ingredient in mealData.ingredients)
              Text(
                ingredient,
              ),
            const SizedBox(height: 24),
            Text(
              'Ingredients',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 16),
            for (final step in mealData.steps)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                child: Text(
                  step,
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
