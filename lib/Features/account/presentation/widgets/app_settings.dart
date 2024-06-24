import 'package:app/core/constants/constants.dart';
import 'package:app/core/manager/theme_cubit/theme_cubit.dart';
import 'package:app/core/utils/app_styles.dart';
import 'package:app/core/widgets/default_switch_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppSettings extends StatelessWidget {
  const AppSettings({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ThemeCubit>();

    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'App Settings',
              style: AppStyles.text20.copyWith(
                color: cubit.isDarkTheme ? kWhiteColor : kLightTextColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsetsDirectional.only(
                top: 14,
                bottom: 14,
                start: 16,
                end: 12,
              ),
              decoration: BoxDecoration(
                color: cubit.isDarkTheme ? kCardColor : kLightCardColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Material(
                color: Colors.transparent,
                child: DefaultSwitchTile(
                  value: cubit.isDarkTheme,
                  titleText: "Dark Theme",
                  onChanged: (value) => cubit.changeTheme(value),
                  icon: Icon(
                    cubit.isDarkTheme ? Icons.dark_mode : Icons.light_mode,
                    color: cubit.isDarkTheme
                        ? kIconsBackgroundColor
                        : kLightTextColor,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 8),

            // lang
            AnimatedContainer(
              height: 74,
              duration: const Duration(milliseconds: 250),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              decoration: BoxDecoration(
                color: cubit.isDarkTheme ? kCardColor : kLightCardColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.language_rounded,
                      color: cubit.isDarkTheme
                          ? kIconsBackgroundColor
                          : kLightTextColor,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Language',
                    style: AppStyles.text16.copyWith(
                      color: kWhiteColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'English',
                    style: AppStyles.text16.copyWith(
                      color:
                          cubit.isDarkTheme ? kPrimaryColor : kLightTextColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
