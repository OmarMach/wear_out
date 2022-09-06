import 'package:flutter/material.dart';

import '../colors.dart';
import '../context.dart';
import '../utils.dart';
import '../widgets/cart_appbar.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = '/ecom/order';
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = getSize(context);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Theme(
          data: Theme.of(context).copyWith(
            inputDecorationTheme: InputDecorationTheme(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: golden),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: orange),
              ),
              floatingLabelStyle: TextStyle(
                color: golden,
                fontWeight: FontWeight.bold,
                fontFamily: 'Vidaloka',
              ),
              hintStyle: TextStyle(
                color: golden.withOpacity(0.5),
                fontWeight: FontWeight.bold,
                fontFamily: 'Vidaloka',
              ),
              labelStyle: TextStyle(
                color: golden,
                fontFamily: 'Vidaloka',
              ),
            ),
          ),
          child: SizedBox(
            height: size.height,
            width: size.width,
            child: Column(
              children: [
                SafeArea(
                  bottom: false,
                  child: CartAppBar(title: 'CHECK-OUT'),
                ),
                verticalSeparator,
                OrderItems(size: size),
                verticalSeparator,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Expanded(child: Divider(color: golden)),
                      Text(
                        'PAYEMENT INFORMATION',
                        style: TextStyle(
                          color: golden,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Vidaloka',
                        ),
                      ),
                      Expanded(child: Divider(color: golden)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      TextField(
                        style: TextStyle(
                          color: golden,
                          fontFamily: 'Vidaloka',
                        ),
                        textInputAction: TextInputAction.next,
                        autofillHints: [AutofillHints.email],
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: 'Omarmachhouty@gmail.com',
                          labelText: 'Email',
                        ),
                      ),
                      verticalSeparator,
                      TextField(
                        style: TextStyle(
                          color: golden,
                          fontFamily: 'Vidaloka',
                        ),
                        textInputAction: TextInputAction.next,
                        autofillHints: [
                          AutofillHints.name,
                          AutofillHints.familyName,
                          AutofillHints.creditCardName,
                        ],
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          hintText: 'Omar MACH',
                          labelText: 'Card owner',
                        ),
                      ),
                      verticalSeparator,
                      TextField(
                        style: TextStyle(
                          color: golden,
                          fontFamily: 'Vidaloka',
                        ),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'XXXX XXXX XXXX XXXX',
                          labelText: 'Credit Card',
                        ),
                      ),
                      verticalSeparator,
                      SizedBox(
                        width: size.width,
                        child: Row(
                          children: [
                            Flexible(
                              child: TextField(
                                style: TextStyle(
                                  color: golden,
                                  fontFamily: 'Vidaloka',
                                ),
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.datetime,
                                decoration: InputDecoration(
                                  hintText: '12/12',
                                  labelText: 'Exp date',
                                ),
                              ),
                            ),
                            horizontalSeparator,
                            Flexible(
                              child: TextField(
                                style: TextStyle(
                                  color: golden,
                                  fontFamily: 'Vidaloka',
                                ),
                                textInputAction: TextInputAction.done,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: 'XXX',
                                  labelText: 'CCV',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                PayButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OrderItems extends StatelessWidget {
  const OrderItems({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        color: golden,
        width: size.width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Expanded(child: Divider(color: backgroundColor)),
                    horizontalSeparator,
                    Text(
                      'ORDER DETAILS',
                      style: TextStyle(
                        color: backgroundColor,
                        fontFamily: 'Vidaloka',
                      ),
                    ),
                    horizontalSeparator,
                    Expanded(child: Divider(color: backgroundColor)),
                  ],
                ),
              ),
              verticalSeparator,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  horizontalSeparator,
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'LEATHER JACKET WITH SOFTNESS',
                          style: TextStyle(
                            color: backgroundColor,
                            fontFamily: 'Vidaloka',
                          ),
                        ),
                        Text(
                          'PPU - 750,00 \$',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: backgroundColor,
                            fontFamily: 'Vidaloka',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'X 1',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: backgroundColor,
                      fontFamily: 'Vidaloka',
                    ),
                  ),
                  horizontalSeparator,
                ],
              ),
              verticalSeparator,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  horizontalSeparator,
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'TAX',
                          style: TextStyle(
                            color: backgroundColor,
                            fontFamily: 'Vidaloka',
                          ),
                        ),
                        Text(
                          '127,50 \$',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: backgroundColor,
                            fontFamily: 'Vidaloka',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              verticalSeparator,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  horizontalSeparator,
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'SHIPPING',
                          style: TextStyle(
                            color: backgroundColor,
                            fontFamily: 'Vidaloka',
                          ),
                        ),
                        Text(
                          '25,00 \$',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: backgroundColor,
                            fontFamily: 'Vidaloka',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              verticalSeparator,
              Divider(color: backgroundColor),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'TOTAL',
                    style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: backgroundColor,
                      fontFamily: 'Vidaloka',
                    ),
                  ),
                  Text(
                    '902,50 \$',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: orange,
                      fontFamily: 'Vidaloka',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PayButton extends StatelessWidget {
  const PayButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => OrderConfirmDialog(),
        );
      },
      child: Container(
        height: 70,
        color: golden,
        child: SafeArea(
          top: false,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'PAY NOW',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: backgroundColor,
                    fontSize: 20,
                    fontFamily: 'Vidaloka',
                  ),
                ),
                horizontalSeparator,
                Icon(
                  Icons.credit_card,
                  color: backgroundColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OrderConfirmDialog extends StatelessWidget {
  const OrderConfirmDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: golden,
      title: Center(
        child: Text(
          'PROCESSING PAYEMENT',
          style: TextStyle(
            color: backgroundColor,
            fontSize: 20,
            fontFamily: 'Vidaloka',
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            'Cancel',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: orange,
              fontFamily: 'Vidaloka',
            ),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            'OK',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: orange,
              fontFamily: 'Vidaloka',
            ),
          ),
        ),
      ],
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Please wait while we process the payement.',
            style: TextStyle(
              color: backgroundColor,
              fontFamily: 'Vidaloka',
            ),
          ),
          verticalSeparator,
          LinearProgressIndicator(
            color: orange,
            backgroundColor: backgroundColor,
          ),
        ],
      ),
    );
  }
}
