import 'package:app/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmerWidget extends StatelessWidget {
  const CustomShimmerWidget({
    super.key,
    this.width,
    this.height,
    this.shape = const RoundedRectangleBorder(),
    this.color,
  });

  final double? width;
  final double? height;
  final ShapeBorder shape;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade200,
      child: Container(
        width: width,
        height: height,
        decoration: ShapeDecoration(
          color: kWhiteColor,
          shape: shape,
        ),
      ),
    );
  }
}
