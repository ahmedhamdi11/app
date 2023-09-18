import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

CustomTransitionPage defaultPageTransitionBuilder({
  required LocalKey key,
  Offset? beginOffset,
  required Widget child,
}) {
  return CustomTransitionPage(
    key: key,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
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
    },
  );
}
