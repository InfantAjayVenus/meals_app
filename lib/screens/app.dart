import 'package:flutter/material.dart';
import 'package:meals_app/data/meals_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/meals.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _AppScreenState();
  }
}

class _AppScreenState extends State<AppScreen> {
  final List<String> favouriteMealIds = [];
  int _activePageIndex = 0;

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
      toggleFavourite: _toggleFavourite,
    );
    if (_activePageIndex == 1) {
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
