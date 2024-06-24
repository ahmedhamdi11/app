import 'package:app/Features/frauds_detection/presentation/widgets/frauds_detection_view_body.dart';
import 'package:app/core/constants/constants.dart';
import 'package:app/core/manager/theme_cubit/theme_cubit.dart';
import 'package:app/core/widgets/default_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FraudsDetectionView extends StatelessWidget {
  const FraudsDetectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Frauds Detection',
          style: TextStyle(
            color:
                context.read<ThemeCubit>().isDarkTheme ? null : kLightTextColor,
          ),
        ),
        leading: const DefaultBackButton(),
      ),
      body: const FraudsDetectionViewBody(),
    );
  }
}
