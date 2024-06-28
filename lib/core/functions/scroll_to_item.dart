import 'package:flutter/material.dart';

void scrollToItem(
  GlobalKey itemGlobalKey, {
  double? alignment,
  Duration? duration,
}) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    Scrollable.ensureVisible(
      itemGlobalKey.currentContext!,
      alignment: alignment ?? 0.5,
      duration: duration ?? const Duration(milliseconds: 500),
    );
  });
}
