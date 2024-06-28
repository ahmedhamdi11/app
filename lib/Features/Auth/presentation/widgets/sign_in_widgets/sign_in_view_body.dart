import 'package:app/Features/Auth/presentation/widgets/sign_in_widgets/sign_in_form.dart';
import 'package:app/Features/Auth/presentation/widgets/sign_in_widgets/sign_in_with_googl_button.dart';
import 'package:app/core/constants/constants.dart';
import 'package:app/core/manager/theme_cubit/theme_cubit.dart';
import 'package:app/core/utils/app_router.dart';
import 'package:app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignInViewBody extends StatelessWidget {
  const SignInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ThemeCubit>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // sign in title
              Text(
                'Sign in',
                style: AppStyles.text34.copyWith(
                  color: cubit.isDarkTheme ? null : kLightTextColor,
                ),
              ),
              Text(
                'Please sign in to continue.',
                style: TextStyle(
                  color: cubit.isDarkTheme
                      ? Colors.white.withOpacity(0.6)
                      : kLightTextColor.withOpacity(0.6),
                ),
              ),
              const SizedBox(height: 22.0),

              // email field, password field ,sign in button
              const SignInForm(),

              const SizedBox(height: 12.0),

              Row(
                children: [
                  Text(
                    'Don\'t have an account?',
                    style: AppStyles.text14.copyWith(
                      color: cubit.isDarkTheme
                          ? Colors.white.withOpacity(0.8)
                          : kLightTextColor.withOpacity(0.6),
                    ),
                  ),
                  // register button
                  TextButton(
                    onPressed: () =>
                        GoRouter.of(context).push(AppRouter.registerViewPath),
                    child: const Text('Register Now'),
                  ),
                ],
              ),

              const SizedBox(height: 42),

              // social logins
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      endIndent: 12,
                      color: cubit.isDarkTheme
                          ? kWhiteColor.withOpacity(0.5)
                          : kLightTextColor.withOpacity(0.5),
                    ),
                  ),
                  Text(
                    'OR',
                    style: AppStyles.text14.copyWith(color: kSecondaryColor),
                  ),
                  Expanded(
                    child: Divider(
                      indent: 12,
                      color: cubit.isDarkTheme
                          ? kWhiteColor.withOpacity(0.5)
                          : kLightTextColor.withOpacity(0.5),
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
