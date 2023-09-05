import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/category_item.dart';
import 'package:meals_app/data/categories_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  _selectCategory(BuildContext context, Category selectedCategory) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return MealsScreen(selectedCategory);
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
