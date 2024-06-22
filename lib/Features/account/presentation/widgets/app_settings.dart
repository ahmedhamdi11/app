import 'package:app/core/constants/constants.dart';
import 'package:app/core/utils/app_styles.dart';
import 'package:app/core/widgets/default_switch_tile.dart';
import 'package:flutter/material.dart';

class AppSettings extends StatelessWidget {
  const AppSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'App Settings',
          style: AppStyles.text20.copyWith(
            color: kWhiteColor,
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
            color: kCardColor,
            borderRadius: BorderRadius.circular(28),
          ),
          child: Material(
            color: Colors.transparent,
            child: DefaultSwitchTile(
              value: true,
              titleText: "Dark Theme",
              onChanged: (value) {},
              icon: const Icon(
                Icons.dark_mode,
                color: kIconsBackgroundColor,
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
            color: kCardColor,
            borderRadius: BorderRadius.circular(28),
          ),
          child: Row(
            children: [
              Container(
                alignment: Alignment.center,
                child: const Icon(
                  Icons.language_rounded,
                  color: kIconsBackgroundColor,
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
                  color: kPrimaryColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
