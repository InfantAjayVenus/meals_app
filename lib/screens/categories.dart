import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/data/categories_data.dart';
import 'package:meals_app/enum/filter_options.dart';
import 'package:meals_app/enum/screen_names.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/providers/filters_provider.dart';
import 'package:meals_app/providers/meals_provider.dart';
import 'package:meals_app/screens/filters.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/category_item.dart';
import 'package:meals_app/widgets/side_drawer.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    Key? key,
  }) : super(key: key);

  _setScreen(BuildContext context, ScreenNames activeScreen) async {
    switch (activeScreen) {
      case ScreenNames.meals:
        Navigator.of(context).pop();
      case ScreenNames.filters:
        Navigator.of(context).pop();
        await Navigator.of(context).push<Map<FilterOptions, bool>>(
            MaterialPageRoute(builder: (context) {
          return const FiltersScreen();
        }));
      default:
        Navigator.of(context).pop();
    }
  }

  _selectCategory(
      BuildContext context, WidgetRef ref, Category selectedCategory) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          final availableMeals = ref.watch(mealsProvider);
          final filterSettings = ref.watch(filtersProvider);
          final mealsList = availableMeals
              .where((element) =>
                  !((filterSettings[FilterOptions.glutenFree]! &&
                          !element.isGlutenFree) ||
                      (filterSettings[FilterOptions.lactoseFree]! &&
                          !element.isLactoseFree) ||
                      (filterSettings[FilterOptions.vegetarian]! &&
                          !element.isVegetarian) ||
                      (filterSettings[FilterOptions.vegan]! &&
                          !element.isVegan)))
              .where(
                (element) => element.categories.contains(selectedCategory.id),
              )
              .toList();
          return MealsScreen(
            mealsList,
            selectedCategory.title,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose a Category'),
      ),
      drawer: SideDrawer(setScreen: _setScreen),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
        child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
            ),
            children: [
              for (final Category category in availableCategories)
                CategoryItem(
                  categoryData: category,
                  onSelectCategory: _selectCategory,
                )
            ]),
      ),
    );
  }
}
