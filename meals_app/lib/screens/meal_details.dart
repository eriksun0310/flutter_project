import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:meals_app/models/meals.dart';
import 'package:transparent_image/transparent_image.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({
    super.key,
    required this.meal,
    required this.onToggleFavorite
  });

  final Meal meal;
  final void Function(Meal meal) onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [IconButton(onPressed: () {
          onToggleFavorite(meal);
        }, icon: const Icon(Icons.star))],
      ),
      //SingleChildScrollView:單一的小部件需要滾動時
      //ListView:用於顯示大量項目
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              meal.imageUrl,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 14,
            ),
            Text(
              'Ingredients',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            const SizedBox(height: 14),
            for (final ingredient in meal.ingredients)
              Text(
                ingredient,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
            const SizedBox(
              height: 24,
            ),
            Text(
              'Steps',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            const SizedBox(height: 14),
            for (final step in meal.steps)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Text(
                  step,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Theme.of(context).colorScheme.onSurface),
                ),
              )
          ],
        ),
      ),
      // body: Container(
      //   child: Column(
      //     children: [
      //       FadeInImage(
      //         // MemoryImage:是一個用於顯示圖像的類
      //         //kTransparentImage:透明的圖像數據
      //         placeholder: MemoryImage(kTransparentImage), //佔位符
      //         image: NetworkImage(meal.imageUrl), // 主圖像
      //         fit: BoxFit.cover, // 圖像填充方式
      //         height: 200, // 高度
      //         width: double.infinity, // 填滿父容器Card的寬度
      //       ),
      //       ...meal.ingredients
      //           .map((ingredient) => Text(
      //                 ingredient,
      //                 style: TextStyle(color: Colors.white),
      //               ))
      //           .toList()
      //     ],
      //   ),
      // ),
    );
  }
}
