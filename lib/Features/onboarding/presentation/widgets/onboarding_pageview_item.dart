import 'package:app/Features/onBoarding/data/data_source/static/onboarding_static_data.dart';
import 'package:app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';

class OnBoardingPageViewItem extends StatelessWidget {
  const OnBoardingPageViewItem({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: const [FadeEffect(duration: Duration(milliseconds: 600))],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          children: [
            const Spacer(flex: 1),

            // page title
            Text(
              onBoardingData[index].title,
              style: AppStyles.text22,
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 8.0),

            // page body
            Text(
              onBoardingData[index].body,
              style: AppStyles.text16.copyWith(
                color: Colors.white.withOpacity(0.5),
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 65.0),

            // page image
            SizedBox(
              width: double.infinity,
              height: 300,
              child: Lottie.asset(
                onBoardingData[index].imagePath,
              ),
            ),

            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
