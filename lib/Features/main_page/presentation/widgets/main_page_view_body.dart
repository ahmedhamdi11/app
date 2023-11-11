import 'package:app/Features/main_page/presentation/widgets/test_ai_models_widget.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 120),
        Expanded(child: TestAiModelsWidget()),
      ],
    );
  }
}
