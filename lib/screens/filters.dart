import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/enum/filter_options.dart';
import 'package:meals_app/providers/filters_provider.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: ref.watch(filtersProvider
                .select((value) => value[FilterOptions.glutenFree]!)),
            onChanged: (isSet) {
              ref
                  .read(filtersProvider.notifier)
                  .toggleFilterOption(FilterOptions.glutenFree);
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
            value: ref.watch(filtersProvider
                .select((value) => value[FilterOptions.lactoseFree]!)),
            onChanged: (isSet) {
              ref
                  .read(filtersProvider.notifier)
                  .toggleFilterOption(FilterOptions.lactoseFree);
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
            value: ref.watch(filtersProvider
                .select((value) => value[FilterOptions.vegetarian]!)),
            onChanged: (isSet) {
              ref
                  .read(filtersProvider.notifier)
                  .toggleFilterOption(FilterOptions.vegetarian);
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
            value: ref.watch(
                filtersProvider.select((value) => value[FilterOptions.vegan]!)),
            onChanged: (isSet) {
              ref
                  .read(filtersProvider.notifier)
                  .toggleFilterOption(FilterOptions.vegan);
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
    );
  }
}
