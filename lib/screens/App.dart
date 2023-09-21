import 'package:flutter/material.dart';
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
  int _activePageIndex = 0;
  @override
  Widget build(BuildContext context) {
    Widget content = const CategoriesScreen();
    if (_activePageIndex == 1) {
      content = const MealsScreen([], 'Favourites');
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
