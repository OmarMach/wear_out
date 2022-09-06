import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../colors.dart';
import '../context.dart';
import 'vertical_text.dart';

class SectionWidget extends StatelessWidget {
  const SectionWidget({
    Key? key,
    required this.imageUrl,
    required this.sectionTitle,
    required this.imageHeight,
    required this.titleOrientation,
    this.imageAlighement,
    this.textColor,
    this.onTap,
    this.textContainerColor,
  }) : super(key: key);

  final String imageUrl;
  final String sectionTitle;
  final double imageHeight;
  final Alignment? imageAlighement;
  final SectionTitleOrientation titleOrientation;
  final Color? textColor;
  final Color? textContainerColor;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap != null ? onTap!() : null,
      child: Stack(
        children: [
          CachedNetworkImage(
            placeholder: (context, _) => Shimmer.fromColors(
              baseColor: golden.withOpacity(0.2),
              highlightColor: golden.withOpacity(0.25),
              enabled: true,
              child: Container(color: golden),
            ),
            imageUrl: imageUrl,
            height: imageHeight,
            width: getSize(context).width,
            fit: BoxFit.cover,
            alignment: imageAlighement ?? const Alignment(0, 0),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            left: titleOrientation == SectionTitleOrientation.left ? 0 : null,
            right: titleOrientation == SectionTitleOrientation.right ? 0 : null,
            child: Container(
              color: textContainerColor ?? Colors.black,
              child: VerticalText(
                text: sectionTitle,
                style: TextStyle(
                  fontFamily: 'Vidaloka',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: textColor ?? Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

enum SectionTitleOrientation { left, right, top, bottom }
