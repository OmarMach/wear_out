import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../colors.dart';

class ShimmerImagePlaceHolder extends StatelessWidget {
  const ShimmerImagePlaceHolder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: golden.withOpacity(0.2),
      highlightColor: golden.withOpacity(0.25),
      enabled: true,
      child: Container(color: golden),
    );
  }
}
