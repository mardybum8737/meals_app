// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:meals_app/providers/favorites_provider.dart';
// import 'package:meals_app/providers/meals_provider.dart';
// import 'package:meals_app/screens/categories_screen.dart';
// import 'package:meals_app/screens/filters_screen.dart';
// import 'package:meals_app/screens/meals_screen.dart';
// import 'package:meals_app/widgets/main_drawer.dart';

// const kInitialFilters = {
//   // k on variable name stands for global variable
//   Filter.glutenFree: false,
//   Filter.lactoseFree: false,
//   Filter.vegetarian: false,
//   Filter.vegan: false,
// };

// class TabsScreen extends ConsumerStatefulWidget {
//   const TabsScreen({super.key});

//   @override
//   ConsumerState<TabsScreen> createState() {
//     return _TabsScreenState();
//   }
// }

// class _TabsScreenState extends ConsumerState<TabsScreen> {
//   int _selectPageIndex = 0;
//   Map<Filter, bool> _selectedFilters = kInitialFilters;

//   void _selectPage(int index) {
//     setState(() {
//       _selectPageIndex = index;
//     });
//   }

//   void _setScreen(String identifier) async {
//     Navigator.of(context).pop();
//     if (identifier == 'filters') {
//       final result = await Navigator.of(context).push<Map<Filter, bool>>(
//         MaterialPageRoute(
//           builder: (context) => FiltersScreen(
//             currentFilters: _selectedFilters,
//           ),
//         ),
//       );

//       setState(() {
//         _selectedFilters = result ?? kInitialFilters;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final meals = ref.watch(mealsProvider); // read 대신 watch 사용하는 것이 조금 더 권장된다.
//     final availableMeals = meals.where((meal) {
//       if (_selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
//         return false;
//       }
//       if (_selectedFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
//         return false;
//       }
//       if (_selectedFilters[Filter.vegetarian]! && !meal.isVegetarian) {
//         return false;
//       }
//       if (_selectedFilters[Filter.vegan]! && !meal.isVegan) {
//         return false;
//       }
//       return true;
//     }).toList();

//     Widget activePage = CategoriesScreen(
//       availableMeals: availableMeals,
//     );
//     var activePageTitle = 'Categories';

//     if (_selectPageIndex == 1) {
//       final favoriteMeals = ref.watch(favoritesMealsProvider);
//       activePage = MealsScreen(
//         meals: favoriteMeals,
//       );
//       activePageTitle = 'Your Favorites';
//     }

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(activePageTitle),
//       ),
//       drawer: MainDrawer(
//         onSelectScreen: _setScreen,
//       ),
//       body: activePage,
//       bottomNavigationBar: BottomNavigationBar(
//         onTap: _selectPage,
//         currentIndex: _selectPageIndex,
//         items: const [
//           BottomNavigationBarItem(
//               icon: Icon(Icons.set_meal), label: 'Categories'),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.star_rounded), label: 'Favorites'),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/favorites_provider.dart';
import 'package:meals_app/providers/meals_provider.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';

const kInitialFilters = {
  // k on variable name stands for global variable
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectPageIndex = 0;
  Map<Filter, bool> _selectedFilters = kInitialFilters;

  void _selectPage(int index) {
    setState(() {
      _selectPageIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (context) => FiltersScreen(
            currentFilters: _selectedFilters,
          ),
        ),
      );

      setState(() {
        _selectedFilters = result ?? kInitialFilters;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealsProvider); // read 대신 watch 사용하는 것이 조금 더 권장된다.
    final availableMeals = meals.where((meal) {
      if (_selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectedFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_selectedFilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (_selectedFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();

    Widget activePage = CategoriesScreen(
      availableMeals: availableMeals,
    );
    var activePageTitle = 'Categories';

    if (_selectPageIndex == 1) {
      final favoriteMeals = ref.watch(favoriteMealsProvider);
      activePage = MealsScreen(
        meals: favoriteMeals,
      );
      activePageTitle = 'Your Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectPageIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(
              icon: Icon(Icons.star_rounded), label: 'Favorites'),
        ],
      ),
    );
  }
}
