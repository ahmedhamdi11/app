import 'package:app/Features/home/presentation/widgets/test_ai_models_widget.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 120),
        Expanded(child: const TestAiModelsWidget()),
      ],
    );
  }
}
