import 'package:app/Features/test/presentation/widgets/test_models_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: const [
        FadeEffect(),
      ],
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        children: [
          TestAiModelsCard(
            titleText: 'Frauds Detection',
            bodyText:
                'Test our frauds detection ai model and protect your self from credit card frauds.',
            iconPath: 'assets/icons/credit-card_icon.svg',
            onBtnPressed: () {},
          ),
          TestAiModelsCard(
            titleText: 'Attack Detection',
            bodyText:
                'Test our Attack detection ai model and protect your self from cyber security attacks.',
            iconPath: 'assets/icons/attack_icon.svg',
            onBtnPressed: () {},
          ),
          TestAiModelsCard(
            titleText: 'Malware Detection',
            bodyText:
                'Scan your device and protect your self from malware files and applications.',
            iconPath: 'assets/icons/malware_icon.svg',
            onBtnPressed: () {},
          ),
          TestAiModelsCard(
            titleText: 'Phishing Emails',
            bodyText:
                'Test our Phishing Emails detection ai model and protect your self from phishing emails.',
            iconPath: 'assets/icons/email-detection_icon.svg',
            onBtnPressed: () {},
          ),
          const SizedBox(
            height: 120,
          ),
        ],
      ),
    );
  }
}
