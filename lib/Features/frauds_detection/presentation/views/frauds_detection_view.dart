import 'package:app/Features/frauds_detection/presentation/widgets/frauds_detection_view_body.dart';
import 'package:app/core/constants/constants.dart';
import 'package:flutter/material.dart';

class FraudsDetectionView extends StatelessWidget {
  const FraudsDetectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(title: const Text('Frauds Detection')),
      body: Container(
        decoration: const BoxDecoration(gradient: kGradientColor),
        child: const FraudsDetectionViewBody(),
      ),
    );
  }
}
