import 'package:app/Features/Auth/presentation/widgets/sign_in_form.dart';
import 'package:app/Features/Auth/presentation/widgets/sign_in_with_googl_button.dart';
import 'package:app/core/constants/constants.dart';
import 'package:app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class SignInViewBody extends StatelessWidget {
  const SignInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // sign in title
              const Text(
                'Sign in',
                style: AppStyles.text34,
              ),
              Text(
                'Please sign in to continue.',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                ),
              ),
              const SizedBox(height: 22.0),

              // email field, password field ,sign in button
              const SignInForm(),

              const SizedBox(height: 48),

              // social logins
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      endIndent: 12,
                      color: kWhiteColor.withOpacity(0.5),
                    ),
                  ),
                  Text(
                    'OR',
                    style: AppStyles.text14.copyWith(color: kSecondaryColor),
                  ),
                  Expanded(
                    child: Divider(
                      indent: 12,
                      color: kWhiteColor.withOpacity(0.5),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              const SignInWithGoogleButton(),

              const SizedBox(height: 26),
            ],
          ),
        ),
      ),
    );
  }
}
