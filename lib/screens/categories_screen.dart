import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/category_model.dart';
import 'package:meals_app/models/meal_model.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.availableMeals});

  final List<Meal> availableMeals;

  void _selectCategory(BuildContext context, CategoryModel category) {
    final filteredMeal = availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MealsScreen(
          title: category.title,
          meals: filteredMeal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      children: [
        // availableCategories.map((category) => CategoryGridItem(category: category)).toList(),
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            onSelectCategory: (category) => _selectCategory(context, category),
          )
      ],
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:meals_app/data/dummy_data.dart';
// import 'package:meals_app/models/category_model.dart';
// import 'package:meals_app/models/meal_model.dart';
// import 'package:meals_app/screens/meals_screen.dart';
// import 'package:meals_app/widgets/category_grid_item.dart';

// class CategoriesScreen extends StatelessWidget {
//   const CategoriesScreen({super.key, required this.availableMeals});

//   final List<Meal> availableMeals;

//   void _selectCategory(BuildContext context, CategoryModel category) {
//     final filteredMeal = availableMeals
//         .where((meal) => meal.categories.contains(category.id))
//         .toList();

//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => MealsScreen(
//           title: category.title,
//           meals: filteredMeal,
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GridView(
//       padding: const EdgeInsets.all(16),
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         childAspectRatio: 3 / 2,
//         crossAxisSpacing: 12,
//         mainAxisSpacing: 12,
//       ),
//       children: [
//         // availableCategories.map((category) => CategoryGridItem(category: category)).toList(),
//         for (final category in availableCategories)
//           CategoryGridItem(
//             category: category,
//             onSelectCategory: (category) => _selectCategory(context, category),
//           )
//       ],
//     );
//   }
// }
