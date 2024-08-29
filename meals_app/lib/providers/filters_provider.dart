import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Filter { glutenFree, lactoseFree, vagetarian, vegan }

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
      : super({
          Filter.glutenFree: false,
          Filter.lactoseFree: false,
          Filter.vagetarian: false,
          Filter.vegan: false,
        });


  void setFilters(Map<Filter, bool> chosenFilters){
    state = chosenFilters;
  }

  void setFilter(Filter filter, bool isActive) {
    // state[filter] = isActive // 這個寫法是不允許的
    state = {...state, filter: isActive};
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>(
        (ref) => FiltersNotifier());
