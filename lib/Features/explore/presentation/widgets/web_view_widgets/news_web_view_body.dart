import 'package:app/core/widgets/custom_shimmer_widget.dart';
import 'package:flutter/material.dart';
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
          LinearProgressIndicator(
            value: loadingProgress,
          ),

        // body (web view)
        loadingProgress == 1
            ? Expanded(
                child: WebViewWidget(
                  controller: controller,
                ),
              )
            : const Expanded(
                child: CustomShimmerWidget(),
              ),
      ],
    );
  }
}
