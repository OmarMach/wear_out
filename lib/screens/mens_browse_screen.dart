// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../colors.dart';
import '../context.dart';
import '../data/mock_data.dart';
import '../models/product.dart';
import '../styles.dart';
import '../utils.dart';
import '../widgets/cart_appbar.dart';
import '../widgets/shimmer_image.dart';
import 'product_details_screen.dart';

class MensBrowseScreen extends StatelessWidget {
  const MensBrowseScreen({Key? key}) : super(key: key);
  static const routeName = '/ecom/mens';
  @override
  Widget build(BuildContext context) {
    final size = getSize(context);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              const CartAppBar(title: 'MEN\'S'),
              Text(
                'Free',
                style: serifTitle,
              ),
              Text(
                'Your Inner Style',
                style: serifTitle,
              ),
              smallVerticalSeparator,
              Container(
                width: size.width / 3,
                height: 2,
                color: golden,
              ),
              verticalSeparator,
              SearchBarWidget(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'LIMITED EDITION',
                      style: serifBody.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    horizontalSeparator,
                    Expanded(
                      child: Container(
                        height: 1,
                        color: golden,
                      ),
                    ),
                    horizontalSeparator,
                    GestureDetector(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          'See all',
                          style: serifBody.copyWith(
                            color: orange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              CarouselSlider(
                options: CarouselOptions(
                  height: size.height * .4,
                  enableInfiniteScroll: false,
                  viewportFraction: 0.5,
                  pageSnapping: false,
                  enlargeCenterPage: true,
                  initialPage: 1,
                ),
                items: [
                  ...limitedEditionProductsMen.map((e) => LimitedEditionProductItem(product: e, size: size)).toList(),
                ],
              ),
              verticalSeparator,
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 1,
                      color: golden,
                    ),
                  ),
                  horizontalSeparator,
                  Text(
                    'CATEGORIES',
                    style: serifBody.copyWith(fontWeight: FontWeight.bold),
                  ),
                  horizontalSeparator,
                  Expanded(
                    child: Container(
                      height: 1,
                      color: golden,
                    ),
                  ),
                ],
              ),
              smallVerticalSeparator,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CategoryUnderlineItem(label: 'ALL'),
                  CategoryUnderlineItem(isActive: true, label: 'ACCESSOIRES'),
                  CategoryUnderlineItem(label: 'SUITS'),
                  CategoryUnderlineItem(label: 'BAGS'),
                ],
              ),
              GridView.builder(
                padding: const EdgeInsets.all(8),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 10,
                  mainAxisExtent: size.height / 3,
                ),
                itemCount: menAccessoires.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => ShapProductListItem(product: menAccessoires.elementAt(index)),
              ),
              SafeArea(top: false, child: Container()),
            ],
          ),
        ),
      ),
    );
  }
}

class ShapProductListItem extends StatelessWidget {
  const ShapProductListItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, ProductDetailsScreen.routeName, arguments: product),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Hero(
            tag: product.coverImage,
            child: CachedNetworkImage(
              placeholder: (_, __) => ShimmerImagePlaceHolder(),
              imageUrl: product.coverImage,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: GestureDetector(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: orange.withOpacity(.8)),
                        color: orange.withOpacity(.3),
                      ),
                      padding: EdgeInsets.all(8),
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
          if (product.salePercentage != null)
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                color: orange,
                padding: EdgeInsets.all(8),
                child: Text(
                  '-${product.salePercentage}%',
                  style: serifBody.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.black.withOpacity(.5),
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: serifBody.copyWith(color: Colors.white),
                  ),
                  smallVerticalSeparator,
                  Builder(
                    builder: (context) => product.salePercentage != null
                        ? Row(
                            children: [
                              Text(
                                '${(product.price)} \$',
                                style: serifBody.copyWith(
                                  color: backgroundColor,
                                  decoration: TextDecoration.lineThrough,
                                  decorationThickness: 2,
                                  decorationColor: backgroundColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '  •  ${product.price - ((product.price * product.salePercentage!) / 100)} \$',
                                style: serifBody.copyWith(
                                  color: orange,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          )
                        : Text(
                            '${product.price} \$',
                            style: serifBody.copyWith(
                              color: orange,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CategoryUnderlineItem extends StatelessWidget {
  const CategoryUnderlineItem({
    Key? key,
    this.isActive = false,
    this.ontap,
    required this.label,
  }) : super(key: key);

  final bool isActive;
  final String label;
  final Function? ontap;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: GestureDetector(
        onTap: () {
          if (ontap != null) ontap!();
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              FittedBox(
                child: Text(
                  label,
                  style: serifBody.copyWith(
                    fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
              if (isActive) ...[
                smallVerticalSeparator,
                Container(
                  height: 1,
                  width: 20,
                  color: golden,
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        // height: 100,
        color: golden.withOpacity(0.5),
        child: Row(
          children: [
            horizontalSeparator,
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search your exclusive outfit..',
                ),
              ),
            ),
            Container(
              color: golden,
              height: 30,
              width: 1,
            ),
            horizontalSeparator,
            GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Search your exclusive outfit.',
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              },
              child: Icon(
                Icons.search,
                color: golden,
              ),
            ),
            horizontalSeparator,
          ],
        ),
      ),
    );
  }
}

class LimitedEditionProductItem extends StatelessWidget {
  const LimitedEditionProductItem({
    Key? key,
    required this.size,
    required this.product,
  }) : super(key: key);

  final Size size;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, ProductDetailsScreen.routeName, arguments: product),
        child: Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 2)),
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
                    child: Container(
                      width: size.width / 2,
                      height: size.height * .4,
                      color: golden,
                    ),
                  ),
                  imageUrl: product.coverImage,
                  fit: BoxFit.cover,
                  width: size.width / 1.6,
                  height: size.height * .5,
                  alignment: const Alignment(0, -.8),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(color: Colors.black.withOpacity(0.2)),
                  padding: const EdgeInsets.all(9),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        child: Text(
                          product.name,
                          style: serifBody.copyWith(color: Colors.white),
                        ),
                      ),
                      smallVerticalSeparator,
                      Text(
                        '4500 \$',
                        style: serifBody.copyWith(
                          color: orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
