import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meals.dart';



//StateNotifier:用於狀態管理 favorites 列表
class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]);

  // 添加 favorites 列表、刪除列表
  bool toggleMealFavoriteStatus(Meal meal) {
    final mealIsFavorite = state.contains(meal);

    //有存在在 favorites 列表
    if (mealIsFavorite) {
      // 移除
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      // 添加
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});
