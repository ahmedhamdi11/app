import 'package:app/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DefaultBackButton extends StatelessWidget {
  const DefaultBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => GoRouter.of(context).pop(),
      icon: const Icon(
        Icons.arrow_back_ios_new,
        color: kWhiteColor,
      ),
    );
  }
}
