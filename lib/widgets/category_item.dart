import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/utils/get_contrasting_color.dart';

class CategoryItem extends ConsumerWidget {
  const CategoryItem(
      {super.key, required this.categoryData, required this.onSelectCategory});
  final Category categoryData;
  final Function onSelectCategory;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        onSelectCategory(context, ref, categoryData);
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              categoryData.color.withOpacity(1),
              categoryData.color.withOpacity(0.9),
              categoryData.color.withOpacity(0.7),
              categoryData.color.withOpacity(0.5),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          color: categoryData.color,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(15),
        child: Text(
          categoryData.title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: getContrastingColor(
                  categoryData.color,
                  luminanceThreshold: 0.3,
                ),
              ),
        ),
      ),
    );
  }
}
