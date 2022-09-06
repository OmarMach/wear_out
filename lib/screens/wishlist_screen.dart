import 'package:flutter/material.dart';

import '../colors.dart';
import '../context.dart';
import '../styles.dart';
import '../utils.dart';
import '../widgets/cart_appbar.dart';

class WishlistScreen extends StatelessWidget {
  static const routeName = '/wishlist';
  const WishlistScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            const CartAppBar(title: 'My Wishlist'),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite,
                    color: golden,
                    size: getSize(context).width / 3,
                  ),
                  const Text(
                    'Your wish list is empty.',
                    style: serifTitle,
                  ),
                  Text(
                    'Browse products and add them to your wishlist through the ❤️ button.',
                    style: serifBody.copyWith(fontSize: 12, color: golden.withOpacity(0.8)),
                  ),
                  verticalSeparator,
                  Container(
                    height: 0.5,
                    color: golden,
                    width: getSize(context).width / 3,
                  ),
                  verticalSeparator,
                  MaterialButton(
                    onPressed: () => Navigator.pop(context),
                    color: orange,
                    elevation: 0,
                    child: Text(
                      'Browse',
                      style: serifBody.copyWith(
                        color: backgroundColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
