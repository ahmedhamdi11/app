import 'dart:math';

import 'package:app/core/constants/constants.dart';
import 'package:app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class OtherSettings extends StatelessWidget {
  const OtherSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Other',
          style: AppStyles.text20.copyWith(
            color: kWhiteColor,
            fontWeight: FontWeight.w500,
          ),
        ),

        const SizedBox(height: 8),

        // app version
        Container(
          height: 74,
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
                  Icons.phone_android_rounded,
                  color: kIconsBackgroundColor,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'App Version',
                style: AppStyles.text16.copyWith(
                  color: kWhiteColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Spacer(),
              Text(
                'v1.0.0',
                style: AppStyles.text16.copyWith(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 8),

        // about us
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
                  Icons.info_outline,
                  color: kIconsBackgroundColor,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'About Us',
                style: AppStyles.text16.copyWith(
                  color: kWhiteColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Spacer(),
              Transform.rotate(
                angle: -pi / 2,
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  color: kPrimaryColor,
                  size: 18,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 8),

        // support
        Container(
          height: 74,
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
                  Icons.support_agent_outlined,
                  color: kIconsBackgroundColor,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'Technical support',
                style: AppStyles.text16.copyWith(
                  color: kWhiteColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 8),

        // app version
        Container(
          height: 74,
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
                  Icons.logout,
                  color: kRedColor,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'Sign out',
                style: AppStyles.text16.copyWith(
                  color: kRedColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 120),
      ],
    );
  }
}
