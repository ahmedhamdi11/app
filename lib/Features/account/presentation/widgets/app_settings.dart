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
            top: 20,
            bottom: 20,
            start: 16,
            end: 12,
          ),
          decoration: BoxDecoration(
            color: kCardColor,
            borderRadius: BorderRadius.circular(28),
          ),
          child: Material(
            color: Colors.transparent,
            child: Column(
              children: [
                // online status
                DefaultSwitchTile(
                  value: true,
                  titleText: "Dark Theme",
                  onChanged: (value) {},
                  icon: const Icon(
                    Icons.dark_mode,
                    color: kIconsBackgroundColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
