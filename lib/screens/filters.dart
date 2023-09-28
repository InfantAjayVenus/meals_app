import 'package:flutter/material.dart';
import 'package:meals_app/enum/filter_options.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen(this.filterSettings, {super.key});
  final Map<FilterOptions, bool> filterSettings;

  @override
  State<StatefulWidget> createState() {
    return _FilterScreenState();
  }
}

class _FilterScreenState extends State<FiltersScreen> {
  bool _isGlutenFreeSet = false;
  bool _isLactoseFreeSet = false;
  bool _isVegetarianSet = false;
  bool _isVeganSet = false;

  @override
  void initState() {
    super.initState();
    _isGlutenFreeSet = widget.filterSettings[FilterOptions.glutenFree]!;
    _isLactoseFreeSet = widget.filterSettings[FilterOptions.lactoseFree]!;
    _isVegetarianSet = widget.filterSettings[FilterOptions.vegetarian]!;
    _isVeganSet = widget.filterSettings[FilterOptions.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            FilterOptions.glutenFree: _isGlutenFreeSet,
            FilterOptions.lactoseFree: _isLactoseFreeSet,
            FilterOptions.vegetarian: _isVegetarianSet,
            FilterOptions.vegan: _isVeganSet,
          });
          return false;
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _isGlutenFreeSet,
              onChanged: (isSet) {
                setState(() {
                  _isGlutenFreeSet = isSet;
                });
              },
              title: Text(
                'Gluten-Free',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              subtitle: Text(
                'Only include Gluten-Free meals',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            SwitchListTile(
              value: _isLactoseFreeSet,
              onChanged: (isSet) {
                setState(() {
                  _isLactoseFreeSet = isSet;
                });
              },
              title: Text(
                'Lactose-Free',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              subtitle: Text(
                'Only include Lactose-Free meals',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            SwitchListTile(
              value: _isVegetarianSet,
              onChanged: (isSet) {
                setState(() {
                  _isVegetarianSet = isSet;
                });
              },
              title: Text(
                'Vegetarian',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              subtitle: Text(
                'Only include Vegetarian meals',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            SwitchListTile(
              value: _isVeganSet,
              onChanged: (isSet) {
                setState(() {
                  _isVeganSet = isSet;
                });
              },
              title: Text(
                'Vegan',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              subtitle: Text(
                'Only include Vegan meals',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
