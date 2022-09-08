import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../colors.dart';
import '../context.dart';
import '../data/mock_data.dart';
import '../utils.dart';

import 'package:shimmer/shimmer.dart';

import '../../colors.dart';
import '../widgets/cart_appbar.dart';
import 'product_details_screen.dart';

class CategoryMenuItem {
  final String label;
  bool isActive;

  CategoryMenuItem({
    required this.label,
    this.isActive = false,
  });
}

class ProductsListScreen extends StatefulWidget {
  const ProductsListScreen({Key? key}) : super(key: key);
  static const routeName = '/products-list';

  @override
  State<ProductsListScreen> createState() => _ProductsListScreenState();
}

class _ProductsListScreenState extends State<ProductsListScreen> {
  final List<CategoryMenuItem> categories = [
    CategoryMenuItem(label: 'ALL', isActive: true),
    CategoryMenuItem(label: 'WINTER'),
    CategoryMenuItem(label: 'ACCESSOIRES'),
    CategoryMenuItem(label: 'SPORTS'),
  ];
  @override
  Widget build(BuildContext context) {
    final size = getSize(context);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SafeArea(
              bottom: false,
              child: CartAppBar(title: 'TOP SALES'),
            ),
            verticalSeparator,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...categories.map((e) => CategoryItem(categoryMenuItem: e)).toList(),
              ],
            ),
            verticalSeparator,
            CarouselProductsList(size: size),
            verticalSeparator,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Discover',
                            style: TextStyle(
                              fontFamily: 'Vidaloka',
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: golden,
                            ),
                          ),
                          Text(
                            'Explore our products',
                            style: TextStyle(
                              fontFamily: 'Vidaloka',
                              // fontSize: 16,
                              color: golden.withOpacity(0.6),
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: orange,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Text(
                            'See all',
                            style: TextStyle(
                              fontFamily: 'Vidaloka',
                              color: backgroundColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(color: golden),
                  GridView.builder(
                    padding: const EdgeInsets.all(8),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 10,
                      mainAxisExtent: size.height / 3,
                    ),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: discoverProducts.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final product = discoverProducts.elementAt(index);
                      return ProductGridListItem(product: product);
                    },
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

class ProductGridListItem extends StatelessWidget {
  const ProductGridListItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, ProductDetailsScreen.routeName, arguments: product),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Hero(
              tag: product.coverImage,
              child: CachedNetworkImage(
                placeholder: (context, _) => Shimmer.fromColors(
                  baseColor: golden.withOpacity(0.2),
                  highlightColor: golden.withOpacity(0.25),
                  enabled: true,
                  child: Container(color: golden),
                ),
                imageUrl: product.coverImage,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  child: ClipOval(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.favorite,
                          color: orange,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: GestureDetector(
                child: ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    child: Container(
                      color: Colors.white.withOpacity(0.5),
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  product.name,
                                  style: const TextStyle(
                                    fontFamily: 'Vidaloka',
                                    fontWeight: FontWeight.bold,
                                    color: orange,
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  '${product.price} \$',
                                  style: const TextStyle(
                                    fontFamily: 'Vidaloka',
                                    fontWeight: FontWeight.bold,
                                    color: golden,
                                    // fontSize: 16,
                                  ),
                                ),
                              ],
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
      ),
    );
  }
}

class CarouselProductsList extends StatelessWidget {
  const CarouselProductsList({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: size.height / 3,
        // autoPlay: true,
        enlargeCenterPage: true,
      ),
      items: topSalesProducts.map(
        (product) {
          return Builder(
            builder: (BuildContext context) {
              return GestureDetector(
                onTap: () => Navigator.pushNamed(context, ProductDetailsScreen.routeName, arguments: product),
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Hero(
                            tag: product.coverImage,
                            child: CachedNetworkImage(
                              placeholder: (context, _) => Shimmer.fromColors(
                                baseColor: golden.withOpacity(0.2),
                                highlightColor: golden.withOpacity(0.25),
                                enabled: true,
                                child: Container(color: golden),
                              ),
                              imageUrl: product.coverImage,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    verticalSeparator,
                    Text(
                      '${product.name.toUpperCase()} • ${product.price} \$',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: 'Vidaloka',
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ).toList(),
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key? key,
    required this.categoryMenuItem,
  }) : super(key: key);

  final CategoryMenuItem categoryMenuItem;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        height: 30,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: categoryMenuItem.isActive ? golden : Colors.transparent,
          border: Border.all(color: golden),
          borderRadius: BorderRadius.circular(5),
        ),
        padding: const EdgeInsets.all(8),
        child: FittedBox(
          child: Text(
            categoryMenuItem.label,
            style: TextStyle(
              fontFamily: 'Vidaloka',
              color: categoryMenuItem.isActive ? backgroundColor : golden,
            ),
          ),
        ),
      ),
    );
  }
}
