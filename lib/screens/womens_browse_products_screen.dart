import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../colors.dart';
import '../context.dart';
import '../utils.dart';
import '../widgets/cart_appbar.dart';
import '../widgets/horizontal_section_widget.dart';
import '../widgets/section_widget.dart';
import 'products_list_screen.dart';

class WomensBrowseProductsScreen extends StatelessWidget {
  const WomensBrowseProductsScreen({Key? key}) : super(key: key);
  static const routeName = '/ecom/browse';
  @override
  Widget build(BuildContext context) {
    final size = getSize(context);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SafeArea(bottom: false, child: CartAppBar(title: 'WOMEN\'S')),
            TopSaleWidget(size: size),
            smallVerticalSeparator,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      SectionWidget(
                        onTap: () => Navigator.pushNamed(context, ProductsListScreen.routeName),
                        imageUrl: 'https://images.pexels.com/photos/8991386/pexels-photo-8991386.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
                        imageHeight: size.height * .3,
                        titleOrientation: SectionTitleOrientation.left,
                        sectionTitle: 'VINTAGE',
                        imageAlighement: const Alignment(0, -0.5),
                      ),
                      smallVerticalSeparator,
                      SectionWidget(
                        onTap: () => Navigator.pushNamed(context, ProductsListScreen.routeName),
                        imageUrl: 'https://images.pexels.com/photos/1972115/pexels-photo-1972115.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
                        sectionTitle: 'SPORTS',
                        imageHeight: size.height * .3 - 5,
                        titleOrientation: SectionTitleOrientation.left,
                      ),
                    ],
                  ),
                ),
                smallHorizontalSeparator,
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SectionWidget(
                        onTap: () => Navigator.pushNamed(context, ProductsListScreen.routeName),
                        imageUrl: 'https://images.pexels.com/photos/949670/pexels-photo-949670.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
                        imageHeight: size.height * .6,
                        titleOrientation: SectionTitleOrientation.right,
                        sectionTitle: 'CASUAL',
                        imageAlighement: const Alignment(0.3, 0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            smallVerticalSeparator,
            HorizontalSectionWidget(
              onTap: () => Navigator.pushNamed(context, ProductsListScreen.routeName),
              imageUrl: 'https://images.pexels.com/photos/4974402/pexels-photo-4974402.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
              sectionTitle: 'ACCESSOIRES',
              sectionSubtitle: 'JEWELRY • PURSES • SCARFS • HAIR ACCESSOIRES • KEY RINGS',
              imageHeight: size.height * .3,
              titleOrientation: SectionTitleOrientation.bottom,
              needsSafeArea: true,
            ),
          ],
        ),
      ),
    );
  }
}

class TopSaleWidget extends StatelessWidget {
  const TopSaleWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 4,
      child: Stack(
        children: [
          Hero(
            tag: 'Womens',
            child: CachedNetworkImage(
              placeholder: (context, _) => Shimmer.fromColors(
                baseColor: golden.withOpacity(0.2),
                highlightColor: golden.withOpacity(0.25),
                enabled: true,
                child: Container(color: golden),
              ),
              imageUrl: 'https://images.pexels.com/photos/10147898/pexels-photo-10147898.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
              fit: BoxFit.cover,
              width: size.width,
              alignment: const Alignment(0, -0.5),
            ),
          ),
          Positioned(
            top: 20,
            right: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                verticalSeparator,
                const Text(
                  'TOP SALE',
                  style: TextStyle(
                    fontFamily: 'Vidaloka',
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: backgroundColor,
                  ),
                ),
                verticalSeparator,
                Container(
                  height: 1,
                  width: 150,
                  color: backgroundColor,
                ),
                verticalSeparator,
                const Text(
                  'BEST YOU CAN \nFIND IN THE MARKET',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontFamily: 'Vidaloka',
                    color: backgroundColor,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: GestureDetector(
              onTap: () => Navigator.pushNamed(context, ProductsListScreen.routeName),
              child: Container(
                color: orange,
                width: 50,
                height: 40,
                padding: const EdgeInsets.all(5),
                child: const Center(
                  child: Text(
                    '→',
                    style: TextStyle(
                      fontSize: 20,
                      color: backgroundColor,
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
