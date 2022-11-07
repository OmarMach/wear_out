import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wear_out/providers/cart_provider.dart';

import '../colors.dart';
import '../context.dart';
import '../models/product.dart';
import '../utils.dart';
import '../widgets/back_button_widget.dart';
import '../widgets/favorite_button.dart';
import '../widgets/shimmer_image.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ProductDetailsScreen extends StatefulWidget {
  static const routeName = '/ecom/product';
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int selectedSizeIndex = 0;
  int selectedImage = 0;

  final CarouselController carouselController = CarouselController();
  final CarouselController miniatureCarouselController = CarouselController();

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
            child: Stack(
              fit: StackFit.expand,
              children: [
                Builder(
                  builder: (context) {
                    return product.images.isEmpty
                        ? ProductImageWidget(imageUrl: product.coverImage)
                        : CarouselSlider(
                            carouselController: carouselController,
                            options: CarouselOptions(
                              onPageChanged: (index, reason) {
                                miniatureCarouselController.animateToPage(index);
                              },
                              enlargeStrategy: CenterPageEnlargeStrategy.scale,
                              aspectRatio: 1,
                              disableCenter: true,
                              enlargeCenterPage: false,
                              pageSnapping: true,
                              reverse: false,
                              viewportFraction: 1,
                              initialPage: product.images.indexWhere((element) => element == product.coverImage),
                              scrollPhysics: const ClampingScrollPhysics(),
                              enableInfiniteScroll: false,
                            ),
                            items: product.images
                                .map(
                                  (imageUrl) => GestureDetector(
                                    onTap: () {
                                      miniatureCarouselController.animateToPage(product.images.indexWhere((element) => element == imageUrl));
                                    },
                                    child: ProductImageWidget(imageUrl: imageUrl),
                                  ),
                                )
                                .toList(),
                          );
                  },
                ),
                if (product.images.isNotEmpty) ...[
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          child: Container(
                            color: lightBlue.withOpacity(.2),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(
                                sigmaX: 5,
                                sigmaY: 5,
                              ),
                              child: SizedBox(
                                height: 60,
                                width: product.images.length * 100 >= getSize(context).width ? getSize(context).width : product.images.length * 100,
                                child: CarouselSlider(
                                  carouselController: miniatureCarouselController,
                                  options: CarouselOptions(
                                    aspectRatio: 1,
                                    enableInfiniteScroll: false,
                                    disableCenter: false,
                                    height: 60,
                                    enlargeCenterPage: true,
                                    initialPage: product.images.indexWhere((element) => element == product.coverImage),
                                    viewportFraction: .15,
                                    enlargeStrategy: CenterPageEnlargeStrategy.scale,
                                    onPageChanged: (index, reason) {
                                      carouselController.animateToPage(index);
                                    },
                                  ),
                                  items: product.images
                                      .map(
                                        (imageUrl) => GestureDetector(
                                          onTap: () {
                                            carouselController.animateToPage(product.images.indexWhere((element) => element == imageUrl));
                                          },
                                          child: CachedNetworkImage(
                                            placeholder: (context, _) => const ShimmerImagePlaceHolder(),
                                            imageUrl: imageUrl,
                                            width: getSize(context).width,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      )
                                      .toList(),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  verticalSeparator,
                ],
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
            ),
          ),
          // Expanded(
          //   child: ProductImageWidget(imageUrl: product.coverImage),
          //   flex: 2,
          // ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: orange,
                                ),
                              ),
                              Text(
                                'IN-STOCK (${product.stock})',
                                style: const TextStyle(
                                  fontSize: 9,
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
                          style: TextStyle(
                            fontSize: 18,
                            color: golden,
                          ),
                        ),
                      ),
                      if (product.sizes.isNotEmpty)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ...product.sizes.map(
                              (e) {
                                final currentSizeIndex = product.sizes.indexOf(e);
                                return Flexible(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedSizeIndex = currentSizeIndex;
                                      });
                                    },
                                    child: ClothingSizeWidget(
                                      sizeLabel: e,
                                      isSelected: currentSizeIndex == selectedSizeIndex,
                                    ),
                                  ),
                                );
                              },
                            ).toList(),
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
          GestureDetector(
            onTap: () {
              Provider.of<CartProvider>(context, listen: false).addProduct(
                product: product,
                size: product.sizes.isEmpty ? '' : product.sizes[selectedSizeIndex],
              );
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: golden,
                  dismissDirection: DismissDirection.startToEnd,
                  content: Text('${product.name} • Added successfully.'),
                  duration: const Duration(milliseconds: 500),
                ),
              );
            },
            child: Container(
              color: golden,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SafeArea(
                  top: false,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
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
                                color: Colors.white,
                              ),
                            ),
                          ],
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
    required this.currentImageIndex,
    required this.imagesLenght,
  }) : super(key: key);

  final int currentImageIndex, imagesLenght;

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
    required this.imageUrl,
  }) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: imageUrl,
      child: CachedNetworkImage(
        placeholder: (context, _) => const ShimmerImagePlaceHolder(),
        imageUrl: imageUrl,
        width: getSize(context).width,
        fit: BoxFit.cover,
      ),
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
    return FittedBox(
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
                  color: !isSelected ? golden : backgroundColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
