import 'package:flutter/material.dart';

class MealItemProperty extends StatelessWidget {
  const MealItemProperty(this.propertyValue, this.iconData, {super.key});
  final IconData iconData;
  final String propertyValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          iconData,
          color: Colors.white,
        ),
        Text(
          propertyValue,
          style: Theme.of(context)
              .textTheme
              .labelSmall
              ?.copyWith(color: Colors.white),
        )
      ],
    );
  }
}
