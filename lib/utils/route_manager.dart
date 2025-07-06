import 'package:flutter/material.dart';

import '../screens/all_products_screen.dart';
import '../screens/category_products_screen.dart';
import '../screens/home_screen.dart';

class RouteManager {
  static const String home = '/';
  static const String allProducts = '/products';
  static const String categoryProducts = '/category';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case allProducts:
        return MaterialPageRoute(builder: (_) => const AllProductsScreen());
      default:
        if (settings.name?.startsWith(categoryProducts) == true) {
          final category = settings.name!.substring(
            categoryProducts.length + 1,
          );
          return MaterialPageRoute(
            builder: (_) => CategoryProductsScreen(category: category),
          );
        }
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
  }

  static void navigateToProducts(BuildContext context) {
    Navigator.of(context).pushNamed(allProducts);
  }

  static void navigateToCategory(BuildContext context, String category) {
    Navigator.of(context).pushNamed('$categoryProducts/$category');
  }

  static void navigateToHome(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(home, (route) => false);
  }
}
