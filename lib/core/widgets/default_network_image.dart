import 'package:app/core/constants/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DefaultNetworkImage extends StatelessWidget {
  const DefaultNetworkImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.margin = const EdgeInsets.all(0),
    this.borderRadius = 12.0,
  });

  final String imageUrl;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry margin;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: kIconsBackgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
          errorWidget: (context, url, error) => const Icon(
            Icons.image,
            color: kWhiteColor,
          ),
          placeholder: (context, url) => const Icon(
            Icons.image,
            color: kWhiteColor,
          ),
        ),
      ),
    );
  }
}
