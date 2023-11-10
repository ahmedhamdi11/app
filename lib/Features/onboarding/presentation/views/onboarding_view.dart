import 'package:flutter/material.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return const Column(
            children: [],
          );
        },
      ),
    );
  }
}
