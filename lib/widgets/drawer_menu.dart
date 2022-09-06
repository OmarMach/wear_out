import 'package:flutter/material.dart';

import '../../colors.dart';
import '../screens/cart_screen.dart';
import '../screens/order_screen.dart';
import '../screens/wishlist_screen.dart';
import '../styles.dart';
import '../utils.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: backgroundColor,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Center(
              child: Text(
                'Wearout®',
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'Vidaloka',
                ),
              ),
            ),
            verticalSeparator,
            const Divider(color: golden),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                splashColor: golden,
                onTap: () => Navigator.pushNamed(context, WishlistScreen.routeName),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'My Wishlist',
                            style: bodyStyle.copyWith(fontFamily: 'Vidaloka', color: golden.withOpacity(0.8)),
                          ),
                          // Text(
                          //   'You have 3 items in your wishlist.',
                          //   style: TextStyle(
                          //     fontFamily: 'Vidaloka',
                          //     color: orange,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    horizontalSeparator,
                    Icon(
                      Icons.favorite_rounded,
                      color: orange.withOpacity(.5),
                    ),
                    horizontalSeparator,
                  ],
                ),
              ),
            ),
            const Divider(color: golden),
            InkWell(
              focusColor: golden,
              onTap: () => Navigator.pushNamed(context, OrderScreen.routeName),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      // color: backgroundColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'My Orders',
                                  style: bodyStyle.copyWith(fontFamily: 'Vidaloka', color: golden.withOpacity(0.8)),
                                ),
                                const Text(
                                  'You have new order updates.',
                                  style: TextStyle(
                                    fontFamily: 'Vidaloka',
                                    color: orange,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              color: orange.withOpacity(.8),
                            ),
                            child: const Text(
                              '+9',
                              style: TextStyle(
                                color: backgroundColor,
                              ),
                            ),
                          ),
                          horizontalSeparator,
                          Icon(
                            Icons.shopping_basket_sharp,
                            color: orange.withOpacity(.5),
                          ),
                          horizontalSeparator,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(color: golden),
            InkWell(
              focusColor: golden,
              onTap: () => Navigator.pushNamed(context, CartScreen.routeName),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                // color: backgroundColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'My Cart',
                            style: bodyStyle.copyWith(fontFamily: 'Vidaloka', color: golden.withOpacity(0.8)),
                          ),
                          const Text(
                            'You have 3 items in your cart.',
                            style: TextStyle(
                              fontFamily: 'Vidaloka',
                              color: orange,
                            ),
                          ),
                        ],
                      ),
                    ),
                    horizontalSeparator,
                    Icon(
                      Icons.shopping_cart,
                      color: orange.withOpacity(.5),
                    ),
                    horizontalSeparator,
                  ],
                ),
              ),
            ),
            const Divider(color: golden),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Text(
                    'This is just a demo application, created by Omar Mach you could contact me through the magical button below.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: golden,
                      fontFamily: 'Vidaloka',
                    ),
                  ),
                  const Divider(color: golden),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            color: golden,
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              children: const [
                                Icon(Icons.alternate_email, color: backgroundColor),
                                horizontalSeparator,
                                Expanded(
                                  child: Text(
                                    'My Email',
                                    style: TextStyle(
                                      color: backgroundColor,
                                      fontFamily: 'Vidaloka',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      horizontalSeparator,
                      Expanded(
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            color: golden,
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              children: const [
                                Icon(Icons.developer_board, color: backgroundColor),
                                horizontalSeparator,
                                Expanded(
                                  child: Text(
                                    'GitHub',
                                    style: TextStyle(
                                      color: backgroundColor,
                                      fontFamily: 'Vidaloka',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
