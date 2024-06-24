import 'package:app/core/constants/constants.dart';
import 'package:app/core/manager/theme_cubit/theme_cubit.dart';
import 'package:app/core/widgets/custom_shimmer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewBody extends StatelessWidget {
  const WebviewBody({
    super.key,
    required this.loadingProgress,
    required this.controller,
  });

  final double loadingProgress;
  final WebViewController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // loading progress indicator
        if (loadingProgress != 1)
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: LinearProgressIndicator(
              value: loadingProgress,
              backgroundColor: kCardColor,
            ),
          ),

        // body (web view)
        loadingProgress == 1
            ? Expanded(
                child: WebViewWidget(
                  controller: controller,
                ),
              )
            : Expanded(
                child: CustomShimmerWidget(
                  shimmerLoadingType: ShimmerLoadingType.fade,
                  shimmerBaseColor: context.read<ThemeCubit>().isDarkTheme
                      ? null
                      : kLightCardColor,
                ),
              ),
      ],
    );
  }
}
