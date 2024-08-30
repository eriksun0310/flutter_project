import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meals.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/category_grid_item.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key, required this.availableMeals});

  final List<Meal> availableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

//SingleTickerProviderStateMixin: 用於只需要一個動畫的清況
//TickerProviderStateMixin: 用於需要多個動畫的清況(多個動畫就是, 使用兩個含以上的AnimationController)
class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  // late 變量:確保在使用的時候,已經有值
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        //vsync:告訴AnimationController 何時要進行動畫更新,以整體提供平滑的動畫
        vsync: this,
        duration: const Duration(milliseconds: 300),
        lowerBound: 0,
        upperBound: 1);

    //播放動畫(需調用, 否則動畫是不會執行的)
    _animationController.forward();
  }

  //dispose:是flutter State 類的一個生命週期方法,負責清理和釋放資源(類似於useEffect)
  @override
  void dispose() {
    _animationController.dispose(); // 釋放 _animationController 佔用的資源
    super.dispose();
  }

  //點選餐點類別
  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = widget.availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    //Navigator.push(context, route)
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => MealsScreen(
              title: category.title,
              meals: filteredMeals,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        child: GridView(
          padding: const EdgeInsets.all(24),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, //主軸的交叉方向上顯示 2 列
              childAspectRatio: 3 / 2, //表示每個子項的寬高比為 3:2，這影響子項的顯示形狀。
              crossAxisSpacing: 20, //子項之間在交叉軸方向上的間距為 20 像素
              mainAxisSpacing: 20 //子項之間在主軸方向上的間距為 20 像素
              ),
          children: [
            //availableCategories?.map((category)=>CategoryGridItem(category: category)).toList()
            for (final category in availableCategories)
              CategoryGridItem(
                category: category,
                onSelectCategory: () {
                  _selectCategory(context, category);
                },
              )
          ],
        ),
        builder: (context, child) => SlideTransition(
              position:
                  Tween(begin: const Offset(0, 0.3), end: const Offset(0, 0))
                      .animate(CurvedAnimation(
                          parent: _animationController,
                          curve: Curves.easeInOut)),
              child: child,
            ));
  }
}
