import 'package:flutter/material.dart';

class VerticalText extends StatelessWidget {
  VerticalText({
    Key? key,
    this.style,
    required this.text,
  }) : super(key: key);

  TextStyle? style;

  final String text;

  @override
  Widget build(BuildContext context) {
    style ??= const TextStyle(
      fontFamily: 'Vidaloka',
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: Colors.white,
    );

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          for (var char in text.characters)
            Text(
              char,
              style: style,
            ),
        ],
      ),
    );
  }
}
