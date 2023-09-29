import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/enum/filter_options.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/providers/filters_provider.dart';
import 'package:meals_app/providers/meals_provider.dart';

final filteredMealsProvider = Provider<List<Meal>>((ref) {
  final availableMeals = ref.watch(mealsProvider);
  final filterSettings = ref.watch(filtersProvider);

  return availableMeals
      .where((element) => !((filterSettings[FilterOptions.glutenFree]! &&
              !element.isGlutenFree) ||
          (filterSettings[FilterOptions.lactoseFree]! &&
              !element.isLactoseFree) ||
          (filterSettings[FilterOptions.vegetarian]! &&
              !element.isVegetarian) ||
          (filterSettings[FilterOptions.vegan]! && !element.isVegan)))
      .toList();
});
