import 'package:flutter/material.dart';

import '../colors.dart';

class CenteredSectionTitleWidget extends StatelessWidget {
  const CenteredSectionTitleWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(color: grey)),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: const TextStyle(
              fontFamily: 'PlayfairDisplay',
              fontWeight: FontWeight.bold,
              color: grey,
            ),
          ),
        ),
        const Expanded(
          child: Divider(color: grey),
        ),
      ],
    );
  }
}
