import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wear_out/colors.dart';
import 'package:wear_out/context.dart';
import 'package:wear_out/data/mock_data.dart';
import 'package:wear_out/screens/product_details_screen.dart';
import 'package:wear_out/styles.dart';
import 'package:wear_out/utils.dart';

import '../models/product.dart';

class ProductSearchDelegate extends SearchDelegate {
  @override
  String? get searchFieldLabel => 'Search Products';

  @override
  TextStyle? get searchFieldStyle => const TextStyle(color: orange);

  @override
  InputDecorationTheme? get searchFieldDecorationTheme => const InputDecorationTheme(
        hintStyle: TextStyle(
          color: backgroundColor,
          fontFamily: 'Vidaloka',
        ),
        fillColor: orange,
        border: InputBorder.none,
      );

  @override
  ThemeData appBarTheme(BuildContext context) {
    return super.appBarTheme(context).copyWith(
          backgroundColor: golden,
          secondaryHeaderColor: golden,

          appBarTheme: const AppBarTheme(
            centerTitle: true,
            color: golden,
            toolbarTextStyle: TextStyle(
              color: orange,
              fontFamily: 'Vidaloka',
              fontSize: 30,
            ),
            titleTextStyle: TextStyle(
              color: orange,
              fontSize: 30,
            ),
            elevation: 0,
          ),
          // Appbar textfield style.
          textTheme: const TextTheme(
            headline6: TextStyle(
              color: orange,
              fontFamily: 'Vidaloka',
              fontSize: 18.0,
            ),
          ),
        );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => query = '',
        icon: const Icon(
          Icons.close,
          color: backgroundColor,
        ),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => Navigator.pop(context),
      color: backgroundColor,
      icon: const Icon(Icons.arrow_back_rounded),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    try {
      if (query.isEmpty) {
        return Container(
          color: backgroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.search_sharp,
                size: 100,
                color: golden.withOpacity(.3),
              ),
              Text(
                'Search products',
                textAlign: TextAlign.center,
                style: serifSubTitle.copyWith(color: golden.withOpacity(.3)),
              ),
              const Text(
                'Find what you are looking for in just few clicks',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: golden,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      }

      final List<Product> resultProducts = allProducts
          .where((e) => e.name.toLowerCase().contains(query.toLowerCase()) || e.description.toLowerCase().contains(query.toLowerCase()))
          .toList();

      if (resultProducts.isEmpty) {
        return Container(
          color: backgroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.search_off,
                size: 100,
                color: golden.withOpacity(.3),
              ),
              Text(
                'Not found',
                textAlign: TextAlign.center,
                style: serifSubTitle.copyWith(color: golden.withOpacity(.3)),
              ),
              Text(
                'We were not able to find the product with the keywords you provided.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: golden.withOpacity(.6),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      }

      return Container(
        color: backgroundColor,
        child: ListView.builder(
          itemCount: resultProducts.length,
          itemBuilder: (context, index) {
            final product = resultProducts.elementAt(index);
            return ProductSearchListItem(
              product: product,
              query: query,
              onTap: () => Navigator.pushNamed(context, ProductDetailsScreen.routeName, arguments: product),
            );
          },
        ),
      );
    } catch (e) {
      return Container();
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    try {
      if (query.isEmpty) {
        return Container(
          color: backgroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.search_sharp,
                size: 100,
                color: golden.withOpacity(.3),
              ),
              Text(
                'Search products',
                textAlign: TextAlign.center,
                style: serifSubTitle.copyWith(color: golden.withOpacity(.3)),
              ),
              const Text(
                'Find what you are looking for in just few clicks',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: golden,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      }

      final List<Product> suggestedProducts = allProducts
          .where((e) => e.name.toLowerCase().contains(query.toLowerCase()) || e.description.toLowerCase().contains(query.toLowerCase()))
          .toList();

      if (suggestedProducts.isEmpty) {
        return Container(
          color: backgroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.search_off,
                size: 100,
                color: golden.withOpacity(.3),
              ),
              Text(
                'Not found',
                textAlign: TextAlign.center,
                style: serifSubTitle.copyWith(color: golden.withOpacity(.3)),
              ),
              Text(
                'We were not able to find the product with the keywords you provided.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: golden.withOpacity(.6),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      }
      return Container(
        color: backgroundColor,
        child: ListView.builder(
          itemCount: suggestedProducts.length,
          itemBuilder: (context, index) {
            final product = suggestedProducts.elementAt(index);
            return ProductSearchListItem(
              product: product,
              query: query,
              onTap: () {
                if (query == product.name) {
                  Navigator.pushNamed(context, ProductDetailsScreen.routeName, arguments: product);
                } else {
                  query = product.name;
                }
              },
            );
          },
        ),
      );
    } catch (e) {
      return Container();
    }
  }
}

class ProductSearchListItem extends StatelessWidget {
  const ProductSearchListItem({
    Key? key,
    required this.product,
    required this.query,
    required this.onTap,
  }) : super(key: key);

  final Product product;
  final String query;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => onTap(),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: grey, width: 1.5),
          ),
          width: getSize(context).width,
          height: 80,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Hero(
                    tag: product.coverImage,
                    child: CachedNetworkImage(
                      imageUrl: product.coverImage,
                      height: 50,
                      width: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                horizontalSeparator,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: queryTextBold(
                            product.name,
                            query,
                            const TextStyle(
                              color: golden,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Vidaloka',
                            ),
                          ),
                        ),
                      ),
                      Text(
                        'Stock • ${product.stock}',
                        style: const TextStyle(
                          color: golden,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Vidaloka',
                        ),
                      ),
                      Flexible(
                        child: RichText(
                          text: TextSpan(
                            children: queryTextBold(
                              product.description,
                              query,
                              const TextStyle(color: golden),
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
        ),
      ),
    );
  }
}
