import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../colors.dart';
import '../context.dart';
import '../utils.dart';
import '../data/ecommerce_data.dart';
import '../widgets/back_button_widget.dart';
import '../widgets/favorite_button.dart';
import '../widgets/shimmer_image.dart';
import 'cart_screen.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const routeName = '/ecom/product';
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = getSize(context);
    final product = ModalRoute.of(context)!.settings.arguments as Product;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: ProductImageWidget(
              imageUrl: product.coverImage,
              size: size,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                verticalSeparator,
                const CurrentImageIndicator(),
                verticalSeparator,
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                product.name,
                                style: const TextStyle(
                                  fontFamily: 'Vidaloka',
                                  fontSize: 20,
                                  color: golden,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                product.description,
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontFamily: 'Vidaloka',
                                  fontSize: 12,
                                  color: golden,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${product.price} \$',
                                style: const TextStyle(
                                  fontFamily: 'Vidaloka',
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: orange,
                                ),
                              ),
                              Text(
                                'IN-STOCK (${product.stock})',
                                style: const TextStyle(
                                  fontSize: 9,
                                  fontFamily: 'Vidaloka',
                                  fontWeight: FontWeight.bold,
                                  color: golden,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Divider(color: golden),
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          'SIZE',
                          style: const TextStyle(
                            fontSize: 18,
                            fontFamily: 'Vidaloka',
                            color: golden,
                          ),
                        ),
                      ),
                      if (product.sizes.isNotEmpty)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ...product.sizes.map((e) => ClothingSizeWidget(sizeLabel: e)).toList(),
                          ],
                        ),
                      if (product.sizes.isEmpty) NoSizesWidget(size: size),
                      const Divider(color: golden),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 70,
            child: GestureDetector(
              onTap: () => Navigator.pushNamed(context, CartScreen.routeName),
              child: Container(
                width: size.width,
                height: kTextTabBarHeight,
                decoration: const BoxDecoration(
                  color: golden,
                ),
                child: SafeArea(
                  top: false,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.shopping_bag,
                          color: Colors.white,
                        ),
                        horizontalSeparator,
                        Text(
                          'ADD TO CART',
                          style: TextStyle(
                            fontFamily: 'Vidaloka',
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NoSizesWidget extends StatelessWidget {
  const NoSizesWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: size.width,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color: golden),
        ),
        child: const Center(
          child: Text(
            'No Sizes available',
            style: TextStyle(
              fontSize: 20,
              color: golden,
              fontFamily: 'Vidaloka',
            ),
          ),
        ),
      ),
    );
  }
}

class CurrentImageIndicator extends StatelessWidget {
  const CurrentImageIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 20,
          height: 20,
          child: Center(
            child: Container(
              width: 14,
              height: 14,
              decoration: const BoxDecoration(
                color: golden,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
        horizontalSeparator,
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            border: Border.all(
              color: golden,
              width: 2,
            ),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Container(
              width: 14,
              height: 14,
              decoration: const BoxDecoration(
                color: golden,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
        horizontalSeparator,
        SizedBox(
          width: 20,
          height: 20,
          child: Center(
            child: Container(
              width: 14,
              height: 14,
              decoration: const BoxDecoration(
                color: golden,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ProductImageWidget extends StatelessWidget {
  const ProductImageWidget({
    Key? key,
    required this.size,
    required this.imageUrl,
  }) : super(key: key);

  final Size size;

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Hero(
          tag: imageUrl,
          child: CachedNetworkImage(
            placeholder: (context, _) => const ShimmerImagePlaceHolder(),
            imageUrl: imageUrl,
            width: size.width,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          left: 0,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  BackButtonWidget(),
                  FavoriteIconWidget(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ClothingSizeWidget extends StatelessWidget {
  const ClothingSizeWidget({
    Key? key,
    required this.sizeLabel,
    this.isSelected = false,
  }) : super(key: key);

  final String sizeLabel;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: FittedBox(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 50,
            width: 50,
            decoration: !isSelected
                ? BoxDecoration(
                    border: Border.all(
                      color: golden,
                    ),
                  )
                : const BoxDecoration(color: golden),
            child: Center(
              child: FittedBox(
                child: Text(
                  sizeLabel,
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Vidaloka',
                    color: !isSelected ? golden : backgroundColor,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
