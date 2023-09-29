import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/providers/favourite_meals_provider.dart';

class MealInfo extends ConsumerWidget {
  const MealInfo(this.mealData, {super.key});
  final Meal mealData;

  @override
  build(BuildContext context, WidgetRef ref) {
    final isFavourite = ref.watch(favouriteMealsProvider).contains(mealData.id);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          mealData.title,
          overflow: TextOverflow.ellipsis,
        ),
        actions: [
          IconButton(
            icon: Icon(
              isFavourite ? Icons.star : Icons.star_border,
              color: Theme.of(context).colorScheme.primary,
            ),
            onPressed: () {
              final isSet = ref
                  .read(favouriteMealsProvider.notifier)
                  .toggleFavourite(mealData.id);

              ScaffoldMessenger.of(context).removeCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(isSet
                      ? 'Meal added to favourites'
                      : 'Meal removed from favourites'),
                ),
              );
            },
          )
        ],
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
