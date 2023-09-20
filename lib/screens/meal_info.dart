import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealInfo extends StatelessWidget {
  const MealInfo(this.mealData, {super.key});
  final Meal mealData;

  @override
  build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mealData.title),
      ),
      body: Container(),
    );
  }
}
