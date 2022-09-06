import 'package:flutter/material.dart';

import '../colors.dart';

class CartAppBar extends StatelessWidget {
  const CartAppBar({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const BackButton(),
        Expanded(
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                fontFamily: 'Vidaloka',
                fontSize: 20,
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.shopping_bag_outlined,
            color: golden,
          ),
        ),
      ],
    );
  }
}
