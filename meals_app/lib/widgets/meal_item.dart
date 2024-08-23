import 'package:flutter/material.dart';
import 'package:meals_app/models/meals.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal});
  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {},
        child: Stack(
          children: [
            //FadeInImage:圖片加載時顯示一個佔位符,圖片加載完成後淡入顯示實際圖片
            FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl)),
                Positioned(child: child)
          ],
        ),
      ),
    );
  }
}
