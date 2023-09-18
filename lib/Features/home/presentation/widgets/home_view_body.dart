import 'package:app/core/utils/app_router.dart';
import 'package:app/core/widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28.0),
      children: [
        DefaultButton(
          onPressed: () {},
          btnText: 'Fraud Detection',
        ),
        const SizedBox(
          height: 12.0,
        ),
        DefaultButton(
          onPressed: () {},
          btnText: 'Attack Detection',
        ),
        const SizedBox(
          height: 12.0,
        ),
        DefaultButton(
          onPressed: () {},
          btnText: 'Malware Detection',
        ),
        const SizedBox(
          height: 12.0,
        ),
        DefaultButton(
          onPressed: () {
            GoRouter.of(context).push(AppRouter.emailDetectionViewPath);
          },
          btnText: 'Phishing Email Detection',
        ),
      ],
    );
  }
}
