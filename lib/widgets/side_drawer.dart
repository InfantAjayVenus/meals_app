import 'package:flutter/material.dart';
import 'package:meals_app/enum/screen_names.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({
    super.key,
    required this.setScreen,
  });

  final Function setScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.primary.withOpacity(0.9),
                Theme.of(context).colorScheme.primary.withOpacity(0.7),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.fastfood,
                  size: Theme.of(context).textTheme.headlineLarge?.fontSize,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                const SizedBox(width: 20),
                Text(
                  'Cooking Up!',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.restaurant,
              size: Theme.of(context).textTheme.titleLarge?.fontSize,
            ),
            title: Text(
              'Meals',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            onTap: () {
              setScreen(context, ScreenNames.meals);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.filter_alt,
              size: Theme.of(context).textTheme.titleLarge?.fontSize,
            ),
            title: Text(
              'Filter',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            onTap: () {
              setScreen(context, ScreenNames.filters);
            },
          ),
        ],
      ),
    );
  }
}
