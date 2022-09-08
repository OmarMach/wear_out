import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wear_out/widgets/product_search_delegate.dart';

import '../colors.dart';
import '../context.dart';
import '../data/mock_data.dart';
import '../utils.dart';
import '../widgets/drawer_menu.dart';
import 'mens_browse_screen.dart';
import 'product_details_screen.dart';
import 'womens_browse_products_screen.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/Ecommerce';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey newArrival = GlobalKey();
  final GlobalKey womens = GlobalKey();
  final GlobalKey mens = GlobalKey();

  int currentlyFocusedSection = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerMenu(),
      backgroundColor: backgroundColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            const EcommerceAppbar(),
            Container(
              height: kToolbarHeight,
              decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Scrollable.ensureVisible(
                          newArrival.currentContext!,
                          duration: const Duration(seconds: 1),
                          curve: Curves.easeIn,
                        );
                        currentlyFocusedSection = 0;
                        setState(() {});
                      },
                      child: AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        decoration: BoxDecoration(
                          color: currentlyFocusedSection == 0 ? Colors.black : Colors.transparent,
                          border: const Border(right: BorderSide(color: Colors.black)),
                        ),
                        child: Center(
                          child: Text(
                            'NEW ARRIVAL',
                            style: TextStyle(
                              color: currentlyFocusedSection == 0 ? Colors.white : Colors.black,
                              fontFamily: 'Vidaloka',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Scrollable.ensureVisible(
                          womens.currentContext!,
                          duration: const Duration(seconds: 1),
                          curve: Curves.easeIn,
                        );
                        currentlyFocusedSection = 1;
                        setState(() {});
                      },
                      child: AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        decoration: BoxDecoration(
                          color: currentlyFocusedSection == 1 ? Colors.black : Colors.transparent,
                          border: const Border(right: BorderSide(color: Colors.black)),
                        ),
                        child: Center(
                          child: Text(
                            'FOR WOMEN',
                            style: TextStyle(
                              color: currentlyFocusedSection == 1 ? Colors.white : Colors.black,
                              fontFamily: 'Vidaloka',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        Scrollable.ensureVisible(
                          mens.currentContext!,
                          duration: const Duration(seconds: 1),
                          curve: Curves.easeIn,
                        );
                        currentlyFocusedSection = 2;
                        setState(() {});
                      },
                      child: AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        decoration: BoxDecoration(
                          color: currentlyFocusedSection == 2 ? Colors.black : Colors.transparent,
                          border: const Border(
                            left: BorderSide(color: Colors.black),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'FOR MEN',
                            style: TextStyle(
                              color: currentlyFocusedSection == 2 ? Colors.white : Colors.black,
                              fontFamily: 'Vidaloka',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Column(
                  children: [
                    NewArrivalWidget(key: newArrival),
                    ForWomenWidget(key: womens),
                    ForMenWidget(key: mens),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ForMenWidget extends StatelessWidget {
  const ForMenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = getSize(context);
    return Stack(
      children: [
        Hero(
          tag: 'Mens',
          child: CachedNetworkImage(
            imageUrl: 'https://images.pexels.com/photos/10040216/pexels-photo-10040216.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
            fit: BoxFit.cover,
            width: size.width,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: GestureDetector(
            onTap: () => Navigator.pushNamed(context, MensBrowseScreen.routeName),
            child: Container(
              color: Colors.black,
              width: size.width,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'New collection',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Vidaloka',
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            'MENS FASHION',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Vidaloka',
                              fontSize: 30,
                            ),
                          ),
                          verticalSeparator,
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.white,
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

class ForWomenWidget extends StatelessWidget {
  const ForWomenWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = getSize(context);
    return SizedBox(
      width: size.width,
      child: Stack(
        children: [
          Hero(
            tag: 'Womens',
            child: CachedNetworkImage(
              imageUrl: 'https://images.pexels.com/photos/10147898/pexels-photo-10147898.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: size.width,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  verticalSeparator,
                  Container(
                    width: size.width / 1.5,
                    height: 0.5,
                    color: Colors.white,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        Text(
                          'ENERGETIC STYLE',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Vidaloka',
                            fontSize: 30,
                          ),
                        ),
                        Text(
                          'WITHIN',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Vidaloka',
                            fontSize: 30,
                          ),
                        ),
                        Text(
                          'YOURSELF',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Vidaloka',
                            fontSize: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: size.width / 4,
                    height: 0.5,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: GestureDetector(
              onTap: () => Navigator.pushNamed(context, WomensBrowseProductsScreen.routeName),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: size.width,
                  height: kTextTabBarHeight,
                  color: orange,
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'BROWSE',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
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

class NewArrivalWidget extends StatelessWidget {
  const NewArrivalWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = getSize(context);
    return SizedBox(
      width: size.width,
      child: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
              width: size.width,
              child: Hero(
                tag: 'https://images.pexels.com/photos/6976004/pexels-photo-6976004.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
                child: CachedNetworkImage(
                  imageUrl: 'https://images.pexels.com/photos/6976004/pexels-photo-6976004.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: size.width,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  verticalSeparator,
                  Text(
                    'Discover New',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Vidaloka',
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'Summer Collection',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Vidaloka',
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: GestureDetector(
                onTap: () => Navigator.pushNamed(
                  context,
                  ProductDetailsScreen.routeName,
                  arguments: Product(
                    name: 'Summer Collection',
                    description: 'Lorem ipsum sit dolor amen',
                    price: 450,
                    stock: 2,
                    sizes: ['M'],
                    coverImage: 'https://images.pexels.com/photos/6976004/pexels-photo-6976004.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: size.width,
                    height: kTextTabBarHeight,
                    decoration: BoxDecoration(
                      color: lightBlue,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Center(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'MAKE YOURSELF AWESOME',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class EcommerceAppbar extends StatelessWidget {
  const EcommerceAppbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight,
      decoration: const BoxDecoration(border: Border.symmetric(horizontal: BorderSide(color: Colors.black))),
      child: Row(
        children: [
          Container(
            height: kToolbarHeight,
            decoration: const BoxDecoration(border: Border(right: BorderSide(color: Colors.black))),
            child: GestureDetector(
              onTap: () => Scaffold.of(context).openDrawer(),
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Icon(Icons.menu),
              ),
            ),
          ),
          const Expanded(
            child: Center(
              child: Text(
                'Wearout®',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontFamily: 'Vidaloka',
                ),
              ),
            ),
          ),
          Container(
            height: kToolbarHeight,
            decoration: const BoxDecoration(border: Border(left: BorderSide(color: Colors.black))),
            child: GestureDetector(
              onTap: () {
                showSearch(context: context, delegate: ProductSearchDelegate());
              },
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Icon(Icons.search),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
