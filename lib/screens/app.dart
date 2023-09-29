import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/enum/filter_options.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/providers/favourite_meals_provider.dart';
import 'package:meals_app/providers/meals_provider.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/meals.dart';

class AppScreen extends ConsumerStatefulWidget {
  const AppScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _AppScreenState();
  }
}

class _AppScreenState extends ConsumerState<AppScreen> {
  int _activePageIndex = 0;
  Map<FilterOptions, bool> filterSettings = {
    FilterOptions.glutenFree: false,
    FilterOptions.lactoseFree: false,
    FilterOptions.vegetarian: false,
    FilterOptions.vegan: false,
  };

  _updateFilterSettings(Map<FilterOptions, bool> filterSettings) {
    setState(() {
      this.filterSettings = filterSettings;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = CategoriesScreen(
      filterSettings: filterSettings,
      updateFilterSettings: _updateFilterSettings,
    );
    if (_activePageIndex == 1) {
      final availableMeals = ref.watch(mealsProvider);
      final favouriteMealIds = ref.watch(favouriteMealsProvider);
      List<Meal> favouriteMeals = availableMeals
          .where(
            (element) => favouriteMealIds.contains(element.id),
          )
          .toList();
      content = MealsScreen(
        favouriteMeals,
        'Favourites',
      );
    }
    return Scaffold(
      body: content,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _activePageIndex = index;
          });
        },
        currentIndex: _activePageIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favourites')
        ],
      ),
    );
  }
}
