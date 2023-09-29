import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavouriteMealsNotifier extends StateNotifier<List<String>> {
  FavouriteMealsNotifier() : super([]);

  bool toggleFavourite(String mealId) {
    if (state.contains(mealId)) {
      state = state.where((element) => element != mealId).toList();
      return false;
    } else {
      state = [...state, mealId];
      return true;
    }
  }
}

final favouriteMealsProvider =
    StateNotifierProvider<FavouriteMealsNotifier, List<String>>(
        (ref) => FavouriteMealsNotifier());
