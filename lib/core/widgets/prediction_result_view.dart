import 'package:app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class PredictionResultView extends StatelessWidget {
  const PredictionResultView({
    super.key,
    required this.prediction,
    required this.predictionAccuracy,
    required this.predictionColor,
  });
  final String prediction;
  final String predictionAccuracy;
  final Color predictionColor;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              'prediction: ',
              style: AppStyles.text14,
            ),
            Text(
              prediction,
              style: AppStyles.text14.copyWith(color: predictionColor),
            )
          ],
        ),
        const SizedBox(
          height: 8.0,
        ),
        Text(
          'prediction accuracy: $predictionAccuracy',
          style: AppStyles.text14,
        ),
      ],
    );
  }
}
