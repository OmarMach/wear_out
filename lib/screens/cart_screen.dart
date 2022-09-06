import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../colors.dart';
import '../context.dart';
import '../utils.dart';
import '../widgets/cart_appbar.dart';
import 'order_screen.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/ecom/orders';
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = getSize(context);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          SafeArea(
            bottom: false,
            child: CartAppBar(
              title: 'MY CART',
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 40,
              width: size.width,
              decoration: BoxDecoration(
                border: Border.all(color: golden),
                color: orange,
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.close,
                      color: golden,
                    ),
                    horizontalSeparator,
                    Text(
                      'CLEAR CART',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: golden,
                        fontSize: 20,
                        fontFamily: 'Vidaloka',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          CartItem(),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Divider(color: golden),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'TOTAL',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: golden,
                        fontSize: 20,
                        fontFamily: 'Vidaloka',
                      ),
                    ),
                    Text(
                      '•',
                      style: TextStyle(
                        color: golden,
                        fontSize: 20,
                        fontFamily: 'Vidaloka',
                      ),
                    ),
                    // horizontalSeparator,
                    Text(
                      '750,00 \$',
                      style: TextStyle(
                        color: orange,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: 'Vidaloka',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 70,
            color: golden,
            child: GestureDetector(
              onTap: () => Navigator.pushNamed(context, OrderScreen.routeName),
              child: Center(
                child: SafeArea(
                  top: false,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.shopping_basket,
                        color: backgroundColor,
                      ),
                      horizontalSeparator,
                      Text(
                        'CHECKOUT',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: backgroundColor,
                          fontSize: 20,
                          fontFamily: 'Vidaloka',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  const CartItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = getSize(context);
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        height: size.height / 6,
        width: size.width,
        color: golden,
        child: Row(
          children: [
            Expanded(
              child: Hero(
                tag: 'Arrival',
                child: CachedNetworkImage(
                  placeholder: (context, _) => Shimmer.fromColors(
                    baseColor: golden.withOpacity(0.2),
                    highlightColor: golden.withOpacity(0.25),
                    enabled: true,
                    child: Container(color: golden),
                  ),
                  imageUrl: 'https://images.pexels.com/photos/6976004/pexels-photo-6976004.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'LEATHER JACKET WITH SOFTNESS',
                      style: TextStyle(
                        fontFamily: 'Vidaloka',
                        color: backgroundColor,
                      ),
                    ),
                    Divider(color: backgroundColor),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'SIZE : M',
                                  style: TextStyle(
                                    fontFamily: 'Vidaloka',
                                    color: backgroundColor,
                                  ),
                                ),
                                Divider(color: backgroundColor),
                                Text(
                                  'UNIT PRICE • 750,00 \$',
                                  style: TextStyle(
                                    fontFamily: 'Vidaloka',
                                    color: backgroundColor,
                                  ),
                                ),
                                Divider(color: backgroundColor),
                                Text(
                                  '1 X UNIT(S)',
                                  style: TextStyle(
                                    fontFamily: 'Vidaloka',
                                    color: backgroundColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          horizontalSeparator,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                  child: Container(
                                    color: lightBlue,
                                    child: Icon(
                                      Icons.add,
                                      color: golden,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    color: lightBlue,
                                    child: Icon(
                                      Icons.remove,
                                      color: golden,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
