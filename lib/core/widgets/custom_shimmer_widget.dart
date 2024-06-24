import 'package:app/core/constants/constants.dart';
import 'package:app/core/manager/theme_cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmerWidget extends StatefulWidget {
  const CustomShimmerWidget({
    super.key,
    this.width,
    this.height,
    this.shape = const RoundedRectangleBorder(),
    this.shimmerBaseColor,
    this.shimmerHighlightColor,
    this.shimmerLoadingType = ShimmerLoadingType.shimmer,
    this.fadeLoadingColor = kCardColor,
  });

  final double? width;
  final double? height;
  final ShapeBorder shape;
  final Color? shimmerBaseColor;
  final Color? shimmerHighlightColor;
  final Color fadeLoadingColor;
  final ShimmerLoadingType shimmerLoadingType;

  @override
  State<CustomShimmerWidget> createState() => _CustomShimmerWidgetState();
}

class _CustomShimmerWidgetState extends State<CustomShimmerWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    // initialize the animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    // create tween animation
    _animation = Tween<double>(begin: 0.3, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
      ),
    );

    // start repeating animation
    _controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ThemeCubit>();

    switch (widget.shimmerLoadingType) {
      case ShimmerLoadingType.shimmer:
        return Shimmer.fromColors(
          baseColor: widget.shimmerBaseColor ?? _getDefaultBaseColor(cubit),
          highlightColor:
              widget.shimmerHighlightColor ?? kPrimaryColor.withOpacity(0.25),
          child: Container(
            width: widget.width,
            height: widget.height,
            decoration: ShapeDecoration(
              color: kIconsBackgroundColor,
              shape: widget.shape,
            ),
          ),
        );

      case ShimmerLoadingType.fade:
        return FadeTransition(
          opacity: _animation,
          child: Container(
            width: widget.width,
            height: widget.height,
            decoration: ShapeDecoration(
              color: widget.fadeLoadingColor,
              shape: widget.shape,
            ),
          ),
        );
    }
  }

  Color _getDefaultBaseColor(ThemeCubit cubit) {
    return cubit.isDarkTheme
        ? kIconsBackgroundColor.withOpacity(0.3)
        : kLightTextColor.withOpacity(0.2);
  }
}

enum ShimmerLoadingType {
  fade,
  shimmer,
}
