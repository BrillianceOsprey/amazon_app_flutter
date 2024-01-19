import 'package:amazon_app_flutter/features/address/screens/address_screen.dart';
import 'package:amazon_app_flutter/features/admin/screens/add_product_screen.dart';
import 'package:amazon_app_flutter/features/auth/screens/auth_screen.dart';
import 'package:amazon_app_flutter/features/home/screens/category_deals_screen.dart';
import 'package:amazon_app_flutter/features/home/screens/home_screen.dart';
import 'package:amazon_app_flutter/features/order_details/screens/order_details.dart';
import 'package:amazon_app_flutter/features/product_details/screens/product_details_screen.dart';
import 'package:amazon_app_flutter/features/search/screens/search_screen.dart';
import 'package:amazon_app_flutter/models/order.dart';
import 'package:amazon_app_flutter/models/product.dart';
import 'package:amazon_app_flutter/widgets/bottom_bar_page.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AuthScreen(),
      );

    case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HomeScreen(),
      );
    case BottomBarPage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const BottomBarPage(),
      );
    case AddProductScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AddProductScreen(),
      );

    case CategoryDealsScreen.routeName:
      var category = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => CategoryDealsScreen(
          category: category,
        ),
      );
    case SearchScreen.routeName:
      var searchQuery = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => SearchScreen(
          searchQuery: searchQuery,
        ),
      );
    case ProductDetailScreen.routeName:
      var product = routeSettings.arguments as Product;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => ProductDetailScreen(
          product: product,
        ),
      );
    case AddressScreen.routeName:
      var totalAmount = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => AddressScreen(
          totalAmount: totalAmount,
        ),
      );
    case OrderDetailScreen.routeName:
      var order = routeSettings.arguments as Order;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => OrderDetailScreen(
          order: order,
        ),
      );
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Screen does not exist!'),
          ),
        ),
      );
  }
}
