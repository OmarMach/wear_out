import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wear_out/colors.dart';
import 'package:wear_out/providers/cart_provider.dart';
import 'package:wear_out/widgets/scroll_behaviour.dart';

import 'screens/cart_screen.dart';
import 'screens/home_screen.dart';
import 'screens/mens_browse_screen.dart';
import 'screens/order_screen.dart';
import 'screens/product_details_screen.dart';
import 'screens/products_list_screen.dart';
import 'screens/wishlist_screen.dart';
import 'screens/womens_browse_products_screen.dart';

void main() => runApp(const WearOutApp());

class WearOutApp extends StatelessWidget {
  const WearOutApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CartProvider>(create: (_) => CartProvider()),
      ],
      child: MaterialApp(
        routes: {
          HomeScreen.routeName: (context) => const HomeScreen(),
          ProductDetailsScreen.routeName: (context) => const ProductDetailsScreen(),
          CartScreen.routeName: (context) => const CartScreen(),
          OrderScreen.routeName: (context) => const OrderScreen(),
          WomensBrowseProductsScreen.routeName: (context) => const WomensBrowseProductsScreen(),
          MensBrowseScreen.routeName: (context) => const MensBrowseScreen(),
          ProductsListScreen.routeName: (context) => const ProductsListScreen(),
          WishlistScreen.routeName: (context) => const WishlistScreen(),
        },

        theme: ThemeData(
          fontFamily: 'Vidaloka',
          dialogBackgroundColor: golden,
          dialogTheme: const DialogTheme(
            backgroundColor: golden,
            contentTextStyle: TextStyle(
              color: backgroundColor,
              fontFamily: 'Vidaloka',
            ),
            titleTextStyle: TextStyle(
              color: backgroundColor,
              fontSize: 20,
              fontFamily: 'Vidaloka',
            ),
          ),
        ),
        title: 'WearOut',
        builder: (context, widget) {
          return ScrollConfiguration(behavior: const ScrollBehaviorModified(), child: widget!);
        },
        home: Consumer<CartProvider>(builder: (context, _, __) => const HomeScreen()),
        // home: TestingScreen(),
      ),
    );
  }
}
