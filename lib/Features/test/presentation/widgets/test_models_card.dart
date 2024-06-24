import 'package:app/core/constants/constants.dart';
import 'package:app/core/manager/theme_cubit/theme_cubit.dart';
import 'package:app/core/utils/app_styles.dart';
import 'package:app/core/widgets/default_button.dart';
import 'package:app/core/widgets/svg_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TestAiModelsCard extends StatelessWidget {
  const TestAiModelsCard({
    super.key,
    required this.titleText,
    required this.bodyText,
    this.onBtnPressed,
    this.iconPath = 'assets/icons/test_ai_icon.svg',
  });

  final String titleText;
  final String bodyText;
  final String iconPath;
  final void Function()? onBtnPressed;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ThemeCubit>();

    return Card(
      color: cubit.isDarkTheme ? kCardColor : kLightCardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: cubit.isDarkTheme
                      ? kIconsBackgroundColor
                      : kLightTextColor.withOpacity(0.8),
                  child: SvgIconWidget(
                    iconPath: iconPath,
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        titleText,
                        style: AppStyles.text20.copyWith(color: kWhiteColor),
                      ),
                      Text(
                        bodyText,
                        style: AppStyles.text16
                            .copyWith(color: kWhiteColor.withOpacity(0.5)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
            DefaultButton(
              onPressed: onBtnPressed,
              btnText: 'Scan',
            )
          ],
        ),
      ),
    );
  }
}
