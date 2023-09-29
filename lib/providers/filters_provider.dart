import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/enum/filter_options.dart';

class FiltersProvider extends StateNotifier<Map<FilterOptions, bool>> {
  FiltersProvider()
      : super({
          FilterOptions.glutenFree: false,
          FilterOptions.lactoseFree: false,
          FilterOptions.vegetarian: false,
          FilterOptions.vegan: false,
        });

  void toggleFilterOption(FilterOptions option) {
    state = {...state, option: !state[option]!};
  }

  void updateFilterSettings(Map<FilterOptions, bool> updatedFilterSettings) {
    state = updatedFilterSettings;
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersProvider, Map<FilterOptions, bool>>(
        (ref) => FiltersProvider());
