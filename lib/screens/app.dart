import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/enum/filter_options.dart';
import 'package:meals_app/models/meal.dart';
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
  final List<String> favouriteMealIds = [];
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

  _showToastMessage(String message) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  _toggleFavourite(String mealId) {
    setState(() {
      if (favouriteMealIds.contains(mealId)) {
        favouriteMealIds.remove(mealId);
        _showToastMessage('Meal removed from favourites');
      } else {
        favouriteMealIds.add(mealId);
        _showToastMessage('Meal added to favourites');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = CategoriesScreen(
      filterSettings: filterSettings,
      updateFilterSettings: _updateFilterSettings,
      toggleFavourite: _toggleFavourite,
    );
    if (_activePageIndex == 1) {
      final availableMeals = ref.watch(mealsProvider);
      List<Meal> favouriteMeals = availableMeals
          .where(
            (element) => favouriteMealIds.contains(element.id),
          )
          .toList();
      content = MealsScreen(
        favouriteMeals,
        'Favourites',
        toggleFavourite: _toggleFavourite,
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
