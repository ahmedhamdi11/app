import 'package:app/Features/home/presentation/widgets/home_view_body.dart';
import 'package:app/core/constants/constants.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('The App'),
      ),
      body: Container(
        decoration: const BoxDecoration(gradient: kGradientColor),
        child: const HomeViewBody(),
      ),
    );
  }
}
