import 'package:app/core/constants/constants.dart';
import 'package:app/core/utils/app_router.dart';
import 'package:app/core/utils/app_styles.dart';
import 'package:app/core/widgets/default_alert_dialog.dart';
import 'package:app/core/widgets/svg_icon_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: const [
        FadeEffect(),
      ],
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        children: [
          const SizedBox(
            height: 22,
          ),
          Row(
            children: [
              // icon
              const CircleAvatar(
                radius: 20,
                backgroundColor: kIconsBackgroundColor,
                child: SvgIconWidget(iconPath: 'assets/icons/account_icon.svg'),
              ),

              const SizedBox(width: 12),

              // username and email
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Ahmed Hamdi',
                    style: AppStyles.text18.copyWith(color: kWhiteColor),
                  ),
                  Text(
                    'ahmedhamdi@gmail.com',
                    style: AppStyles.text14.copyWith(
                      color: kWhiteColor.withOpacity(0.7),
                    ),
                  ),
                ],
              ),

              const Spacer(),

              // logout button
              IconButton(
                onPressed: () async {
                  showDialog(
                    context: context,
                    builder: (context) => DefaultAlertDialog(
                      title: Text(
                        'Sign out',
                        style: AppStyles.text18.copyWith(color: kWhiteColor),
                      ),
                      content: Text(
                        'Are you sure you want to sign out?',
                        style: AppStyles.text14.copyWith(
                          color: kWhiteColor.withOpacity(0.6),
                        ),
                      ),
                      actions: [
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            foregroundColor: kRedColor,
                          ),
                          onPressed: () async {
                            await FirebaseAuth.instance.signOut().then((value) {
                              GoRouter.of(context)
                                  .pushReplacement(AppRouter.signInViewPath);
                            });
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
                            style:
                                AppStyles.text14.copyWith(color: kPrimaryColor),
                          ),
                        )
                      ],
                    ),
                  );
                },
                icon: const Icon(
                  Icons.logout_outlined,
                  color: kWhiteColor,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
