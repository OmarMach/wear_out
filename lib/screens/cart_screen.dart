import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wear_out/providers/cart_provider.dart';
import 'package:wear_out/styles.dart';

import '../colors.dart';
import '../context.dart';
import '../models/cart.dart';
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
      body: Consumer<CartProvider>(builder: (context, provider, _) {
        return Column(
          children: [
            const SafeArea(
              bottom: false,
              child: CartAppBar(
                title: 'MY CART',
              ),
            ),
            Expanded(
              child: Builder(
                builder: (context) {
                  return provider.cart.cartItems.isEmpty ? const EmptyCartWidget() : CartItemsWidget(size: size);
                },
              ),
            )
          ],
        );
      }),
    );
  }
}

class EmptyCartWidget extends StatelessWidget {
  const EmptyCartWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.shopping_cart,
                  color: golden.withOpacity(.4),
                  size: getSize(context).width / 3,
                ),
                const Text(
                  'Your cart is empty',
                  style: serifSubTitle,
                ),
                verticalSeparator,
                const Text(
                  'Looks like you haven\'t added any product to your cart yet.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: golden),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 70,
          color: golden,
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Center(
              child: SafeArea(
                top: false,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.shopping_bag,
                      color: backgroundColor,
                    ),
                    horizontalSeparator,
                    Text(
                      'BROWSE PRODUCTS',
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
        ),
      ],
    );
  }
}

class CartItemsWidget extends StatelessWidget {
  const CartItemsWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    final CartProvider cartProvider = Provider.of<CartProvider>(context, listen: false);

    return Column(
      children: [
        GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Center(child: Text('Clear cart')),
                content: const Text(
                  'Are you sure that you want to remove all the selected products from your cart?',
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: orange,
                        fontFamily: 'Vidaloka',
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      cartProvider.clearCart();
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Yes',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: orange,
                        fontFamily: 'Vidaloka',
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(color: golden),
                color: orange,
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.close,
                      color: backgroundColor,
                    ),
                    horizontalSeparator,
                    Text(
                      'CLEAR CART',
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
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(0),
            itemCount: cartProvider.cart.cartItems.length,
            itemBuilder: (BuildContext context, int index) {
              return CartItemWidget(cartItem: cartProvider.cart.cartItems.elementAt(index));
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Divider(color: golden),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    'TOTAL',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: golden,
                      fontSize: 20,
                      fontFamily: 'Vidaloka',
                    ),
                  ),
                  const Text(
                    '•',
                    style: TextStyle(
                      color: golden,
                      fontSize: 20,
                      fontFamily: 'Vidaloka',
                    ),
                  ),
                  // horizontalSeparator,
                  Text(
                    '${cartProvider.cart.calculateCartTotalPrice()} \$',
                    style: const TextStyle(
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
                  children: const [
                    Icon(
                      Icons.credit_score_outlined,
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
        ),
      ],
    );
  }
}

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({Key? key, required this.cartItem}) : super(key: key);

  final CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    final size = getSize(context);
    final CartProvider provider = Provider.of<CartProvider>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        height: size.height / 6,
        width: size.width,
        color: golden,
        child: Row(
          children: [
            Expanded(
              child: CachedNetworkImage(
                placeholder: (context, _) => Shimmer.fromColors(
                  baseColor: golden.withOpacity(0.2),
                  highlightColor: golden.withOpacity(0.25),
                  enabled: true,
                  child: Container(color: golden),
                ),
                imageUrl: cartItem.product.coverImage,
                fit: BoxFit.fitWidth,
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      cartItem.product.name.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: 'Vidaloka',
                        fontWeight: FontWeight.bold,
                        color: backgroundColor,
                      ),
                    ),
                    const Divider(color: backgroundColor),
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
                                if (cartItem.size.isNotEmpty) ...[
                                  Text(
                                    'Size • ${cartItem.size}',
                                    style: const TextStyle(
                                      fontFamily: 'Vidaloka',
                                      color: backgroundColor,
                                    ),
                                  ),
                                  const Divider(color: backgroundColor),
                                ],
                                Text(
                                  'UNIT PRICE • ${cartItem.product.price} \$',
                                  style: const TextStyle(
                                    fontFamily: 'Vidaloka',
                                    color: backgroundColor,
                                  ),
                                ),
                                const Divider(color: backgroundColor),
                                Text(
                                  '${cartItem.quantity} x UNIT(S)',
                                  style: const TextStyle(
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
                                  child: Material(
                                    color: orange,
                                    child: InkWell(
                                      splashColor: lightBlue,
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                            title: const Center(child: Text('Remove product from cart')),
                                            content: const Text(
                                              'Are you sure that you want to remove the selected product from your cart?',
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(context),
                                                child: const Text(
                                                  'Cancel',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: orange,
                                                    fontFamily: 'Vidaloka',
                                                  ),
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  provider.deleteProduct(product: cartItem.product, size: cartItem.size);
                                                  Navigator.pop(context);
                                                },
                                                child: const Text(
                                                  'Yes',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: orange,
                                                    fontFamily: 'Vidaloka',
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                      child: const Icon(
                                        Icons.close,
                                        color: golden,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Material(
                                    color: lightBlue,
                                    child: InkWell(
                                      splashColor: orange,
                                      onTap: () {
                                        provider.addProduct(product: cartItem.product, size: cartItem.size);
                                      },
                                      child: const Icon(
                                        Icons.add,
                                        color: golden,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Material(
                                    color: lightBlue,
                                    child: InkWell(
                                      splashColor: orange,
                                      onTap: () {
                                        provider.decrementProductQuantity(product: cartItem.product, size: cartItem.size);
                                      },
                                      child: const Icon(
                                        Icons.remove,
                                        color: golden,
                                      ),
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
