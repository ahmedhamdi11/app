import 'package:app/Features/attack_detection/presentation/widgets/attack_detection_view_body.dart';
import 'package:app/core/constants/constants.dart';
import 'package:flutter/material.dart';

class AttackDetectionView extends StatelessWidget {
  const AttackDetectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(title: const Text('Attack Detection')),
      body: Container(
        decoration: const BoxDecoration(gradient: kGradientColor),
        child: const AttackDetectionViewBody(),
      ),
    );
  }
}
