import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal_model.dart';
import 'package:meals_app/providers/favorites_provider.dart';

class MealDetailsScreen extends ConsumerWidget {
  const MealDetailsScreen({
    super.key,
    required this.meal,
  });

  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mealsList = ref.watch(favoriteMealsProvider);
    final isMealFavorite = mealsList.contains(meal);

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
              onPressed: () {
                final wasAdded = ref
                    .read(favoriteMealsProvider.notifier)
                    .toggleMealFavoriteStatus(meal);
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(wasAdded
                        ? 'Added to Favorites!'
                        : 'Removed from Favorites.'),
                  ),
                );
              },
              icon: Icon(isMealFavorite ? Icons.star : Icons.star_border))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              meal.imageUrl,
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 14),
            Text(
              'Ingredients',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 14),
            for (final ingredient in meal.ingredients)
              Text(
                ingredient,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
            const SizedBox(height: 24),
            Text(
              'Steps',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 14),
            for (final step in meal.steps)
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Text(
                  step,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:meals_app/models/meal_model.dart';
// import 'package:meals_app/providers/favorites_provider.dart';

// class MealDetailsScreen extends ConsumerWidget {
//   const MealDetailsScreen({
//     super.key,
//     required this.meal,
//   });

//   final Meal meal;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(meal.title),
//         actions: [
//           IconButton(
//               onPressed: () {
//                 final wasAdded = ref
//                     .read(favoritesMealsProvider.notifier)
//                     .toggleMealFavoriteStatus(meal);
//                 ScaffoldMessenger.of(context).clearSnackBars();
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(
//                     content: Text(wasAdded
//                         ? 'Meal added as a favorite.'
//                         : 'Meal removed.'),
//                   ),
//                 );
//               },
//               icon: const Icon(Icons.star))
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Image.network(
//               meal.imageUrl,
//               width: double.infinity,
//               height: 300,
//               fit: BoxFit.cover,
//             ),
//             const SizedBox(height: 14),
//             Text(
//               'Ingredients',
//               style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                     color: Theme.of(context).colorScheme.primary,
//                     fontWeight: FontWeight.bold,
//                   ),
//             ),
//             const SizedBox(height: 14),
//             for (final ingredient in meal.ingredients)
//               Text(
//                 ingredient,
//                 style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                       color: Theme.of(context).colorScheme.onBackground,
//                     ),
//               ),
//             const SizedBox(height: 24),
//             Text(
//               'Steps',
//               style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                     color: Theme.of(context).colorScheme.primary,
//                     fontWeight: FontWeight.bold,
//                   ),
//             ),
//             const SizedBox(height: 14),
//             for (final step in meal.steps)
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//                 child: Text(
//                   step,
//                   textAlign: TextAlign.center,
//                   style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                         color: Theme.of(context).colorScheme.onBackground,
//                       ),
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
