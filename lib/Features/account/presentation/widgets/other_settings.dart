import 'package:app/Features/Auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:app/Features/account/presentation/widgets/about_us_button.dart';
import 'package:app/core/constants/constants.dart';
import 'package:app/core/functions/open_whatsapp_contact.dart';
import 'package:app/core/manager/theme_cubit/theme_cubit.dart';
import 'package:app/core/utils/app_styles.dart';
import 'package:app/core/widgets/default_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class OtherSettings extends StatelessWidget {
  const OtherSettings({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ThemeCubit>();

    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Other',
              style: AppStyles.text20.copyWith(
                color: cubit.isDarkTheme ? kWhiteColor : kLightTextColor,
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 8),

            // app version
            Container(
              height: 74,
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
                      Icons.phone_android_rounded,
                      color: cubit.isDarkTheme
                          ? kIconsBackgroundColor
                          : kLightTextColor,
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
                      color:
                          cubit.isDarkTheme ? kPrimaryColor : kLightTextColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 8),

            // about us
            const AboutUsButton(),

            const SizedBox(height: 8),

            // support
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => openWhatsappContact(),
                borderRadius: BorderRadius.circular(20),
                child: Ink(
                  height: 74,
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                  decoration: BoxDecoration(
                    color: cubit.isDarkTheme ? kCardColor : kLightCardColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.support_agent_outlined,
                          color: cubit.isDarkTheme
                              ? kIconsBackgroundColor
                              : kLightTextColor,
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
              ),
            ),

            const SizedBox(height: 8),

            // sign out
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => _signOut(context, cubit),
                borderRadius: BorderRadius.circular(20),
                child: Ink(
                  height: 74,
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                  decoration: BoxDecoration(
                    color: cubit.isDarkTheme ? kCardColor : Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                    border: cubit.isDarkTheme
                        ? null
                        : Border.all(width: 1, color: kLightCardColor),
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
              ),
            ),

            const SizedBox(height: 120),
          ],
        );
      },
    );
  }

  void _signOut(
    BuildContext context,
    ThemeCubit cubit,
  ) {
    showDialog(
      context: context,
      builder: (context) => DefaultAlertDialog(
        title: Text(
          'Sign out',
          style: AppStyles.text18.copyWith(
            color: cubit.isDarkTheme ? kWhiteColor : kLightTextColor,
          ),
        ),
        content: Text(
          'Are you sure you want to sign out?',
          style: AppStyles.text14.copyWith(
            color: cubit.isDarkTheme
                ? kWhiteColor.withOpacity(0.6)
                : kLightTextColor.withOpacity(0.6),
          ),
        ),
        actions: [
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              foregroundColor: kRedColor,
            ),
            onPressed: () {
              BlocProvider.of<AuthCubit>(context).singOutUser(context);
            },
            child: Text(
              'sign out',
              style: AppStyles.text14.copyWith(color: kRedColor),
            ),
          ),
          OutlinedButton(
            onPressed: () => GoRouter.of(context).pop(),
            child: Text(
              'cancel',
              style: AppStyles.text14.copyWith(
                color: cubit.isDarkTheme ? kPrimaryColor : kLightTextColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
