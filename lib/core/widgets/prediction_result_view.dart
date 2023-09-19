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
            const Text('prediction: '),
            Text(
              prediction,
              style: TextStyle(
                color: predictionColor,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 8.0,
        ),
        Text('prediction accuracy: $predictionAccuracy'),
      ],
    );
  }
}
