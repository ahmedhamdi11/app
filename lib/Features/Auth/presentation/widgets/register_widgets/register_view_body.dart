import 'package:app/Features/Auth/presentation/widgets/register_widgets/register_form.dart';
import 'package:app/core/constants/constants.dart';
import 'package:app/core/manager/theme_cubit/theme_cubit.dart';
import 'package:app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

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
                'Register',
                style: AppStyles.text34.copyWith(
                  color: cubit.isDarkTheme ? null : kLightTextColor,
                ),
              ),
              Text(
                'Create your account now!',
                style: TextStyle(
                  color: cubit.isDarkTheme
                      ? Colors.white.withOpacity(0.6)
                      : kLightTextColor.withOpacity(0.6),
                ),
              ),
              const SizedBox(height: 22.0),

              // email field, password field ,register in button
              const RegisterForm(),

              const SizedBox(height: 12.0),

              Row(
                children: [
                  Text(
                    'Already have an account?',
                    style: AppStyles.text14.copyWith(
                      color: cubit.isDarkTheme
                          ? Colors.white.withOpacity(0.8)
                          : kLightTextColor.withOpacity(0.6),
                    ),
                  ),
                  // register button
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('SignIn'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
