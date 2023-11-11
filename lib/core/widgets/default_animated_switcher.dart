import 'package:flutter/material.dart';

class DefaultAnimatedSwitcher extends StatelessWidget {
  const DefaultAnimatedSwitcher({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 350),
      transitionBuilder: (child, animation) {
        const begin = Offset(0, 0.3);
        const end = Offset.zero;
        final tween = Tween<Offset>(begin: begin, end: end);
        return FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position: tween.animate(animation),
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}
