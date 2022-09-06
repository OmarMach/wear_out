import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../colors.dart';
import '../../context.dart';
import 'section_widget.dart';

class HorizontalSectionWidget extends StatelessWidget {
  const HorizontalSectionWidget({
    Key? key,
    required this.imageUrl,
    required this.sectionTitle,
    required this.imageHeight,
    required this.titleOrientation,
    this.imageAlighement,
    this.textColor,
    this.onTap,
    this.textContainerColor,
    this.sectionSubtitle = '',
    this.needsSafeArea = false,
  }) : super(key: key);

  final String imageUrl;
  final String sectionTitle;
  final String sectionSubtitle;
  final double imageHeight;
  final Alignment? imageAlighement;
  final SectionTitleOrientation titleOrientation;
  final Color? textColor;
  final Color? textContainerColor;
  final Function? onTap;
  final bool needsSafeArea;

  @override
  Widget build(BuildContext context) {
    final size = getSize(context);
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
          GestureDetector(
            onTap: () {},
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
                  height: size.height * .3,
                  width: size.width,
                  alignment: imageAlighement ?? const Alignment(0, 0),
                  fit: BoxFit.cover,
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: titleOrientation == SectionTitleOrientation.bottom ? 0 : null,
                  top: titleOrientation == SectionTitleOrientation.top ? 0 : null,
                  child: Container(
                    color: textContainerColor ?? Colors.black,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              sectionTitle,
                              style: TextStyle(
                                fontFamily: 'Vidaloka',
                                color: textColor ?? Colors.white,
                                fontSize: 30,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                            if (sectionSubtitle.isNotEmpty)
                              FittedBox(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                                  child: Text(
                                    sectionSubtitle,
                                    style: TextStyle(
                                      fontFamily: 'Vidaloka',
                                      color: textColor ?? Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            if (needsSafeArea) SafeArea(top: false, child: Container()),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
