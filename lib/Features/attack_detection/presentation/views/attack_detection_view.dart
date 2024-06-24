import 'package:app/Features/attack_detection/presentation/widgets/attack_detection_view_body.dart';
import 'package:app/core/constants/constants.dart';
import 'package:app/core/manager/theme_cubit/theme_cubit.dart';
import 'package:app/core/widgets/default_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AttackDetectionView extends StatelessWidget {
  const AttackDetectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'Attack Detection',
          style: TextStyle(
            color:
                context.read<ThemeCubit>().isDarkTheme ? null : kLightTextColor,
          ),
        ),
        leading: const DefaultBackButton(),
      ),
      body: const AttackDetectionViewBody(),
    );
  }
}
