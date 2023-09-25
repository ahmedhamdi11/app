import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

CustomTransitionPage defaultPageTransitionBuilder({
  required LocalKey key,
  required Widget child,
  TransitionTypeEnum transitionType = TransitionTypeEnum.rtlWithFade,
  Duration duration = const Duration(milliseconds: 300),
  Duration reverseDuratin = const Duration(milliseconds: 300),
}) {
  return CustomTransitionPage(
    key: key,
    child: child,
    transitionDuration: duration,
    reverseTransitionDuration: reverseDuratin,
    transitionsBuilder: (context, animation, secondAnimation, child) {
      switch (transitionType) {
        case TransitionTypeEnum.fade:
          return FadeTransition(
            opacity: animation,
            child: child,
          );

        case TransitionTypeEnum.rtlWithFade:
          const begin = Offset(1, 0);
          const end = Offset.zero;
          final slidAnimation =
              Tween<Offset>(begin: begin, end: end).animate(animation);
          return FadeTransition(
            opacity: animation,
            child: SlideTransition(
              position: slidAnimation,
              child: child,
            ),
          );
      }
    },
  );
}

enum TransitionTypeEnum {
  fade,
  rtlWithFade,
}
