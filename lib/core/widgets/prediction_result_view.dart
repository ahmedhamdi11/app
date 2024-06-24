import 'package:app/core/constants/constants.dart';
import 'package:app/core/manager/theme_cubit/theme_cubit.dart';
import 'package:app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    final cubit = context.read<ThemeCubit>();

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'prediction: ',
              style: AppStyles.text14.copyWith(
                color: cubit.isDarkTheme ? null : kLightTextColor,
              ),
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
          style: AppStyles.text14.copyWith(
            color: cubit.isDarkTheme ? null : kLightTextColor,
          ),
        ),
      ],
    );
  }
}
