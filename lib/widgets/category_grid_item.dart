import 'package:flutter/material.dart';
import 'package:meals_app/models/category_model.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem(
      {super.key, required this.category, required this.onSelectCategory});

  final CategoryModel category;
  final void Function(CategoryModel category) onSelectCategory;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onSelectCategory(category),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        // Container widget offers background decoration.
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.5),
              category.color.withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:meals_app/models/category_model.dart';

// class CategoryGridItem extends StatelessWidget {
//   const CategoryGridItem(
//       {super.key, required this.category, required this.onSelectCategory});

//   final CategoryModel category;
//   final void Function(CategoryModel category) onSelectCategory;

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () => onSelectCategory(category),
//       splashColor: Theme.of(context).primaryColor,
//       borderRadius: BorderRadius.circular(12),
//       child: Container(
//         // Container widget offers background decoration.
//         padding: const EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(12),
//           gradient: LinearGradient(
//             colors: [
//               category.color.withOpacity(0.5),
//               category.color.withOpacity(0.9),
//             ],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: Text(
//           category.title,
//           style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                 color: Theme.of(context).colorScheme.onBackground,
//               ),
//         ),
//       ),
//     );
//   }
// }
