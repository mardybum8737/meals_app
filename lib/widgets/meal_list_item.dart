import 'package:flutter/material.dart';
import 'package:meals_app/models/meal_model.dart';

class MealListItem extends StatelessWidget {
  const MealListItem({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      margin: const EdgeInsets.all(16),
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Image.network(
            meal.imageUrl,
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: double.maxFinite,
              height: 60,
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
              child: Column(children: [
                Row(
                  children: [
                    Text(
                      meal.title,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Colors.white,
                          ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(meal.complexity.toString()),
                  ],
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
