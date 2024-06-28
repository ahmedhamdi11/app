import 'package:app/Features/Auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:app/core/constants/constants.dart';
import 'package:app/core/manager/theme_cubit/theme_cubit.dart';
import 'package:app/core/widgets/default_button.dart';
import 'package:app/core/widgets/default_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({
    super.key,
  });

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  @override
  void initState() {
    BlocProvider.of<AuthCubit>(context).signInFormKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AuthCubit cubit = BlocProvider.of<AuthCubit>(context);

    return Form(
      key: cubit.signInFormKey,
      child: Column(
        children: [
          // email field
          DefaultTextField(
            hintText: 'Email',
            onChanged: (value) {
              cubit.signInEmail = value;
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your email.';
              } else {
                return null;
              }
            },
            keyboardType: TextInputType.emailAddress,
          ),

          const SizedBox(height: 12.0),

          // password field
          BlocBuilder<AuthCubit, AuthStates>(
            builder: (context, state) {
              return DefaultTextField(
                hintText: 'Password',
                onChanged: (value) {
                  cubit.signInPassword = value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password.';
                  } else {
                    return null;
                  }
                },
                isHiddenPassword: cubit.isHiddenPassword,
                suffix: Padding(
                  padding: const EdgeInsetsDirectional.only(end: 8.0),
                  child: IconButton(
                    onPressed: () => cubit.togglePasswordVisibility(),
                    icon: Icon(
                      cubit.isHiddenPassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      size: 22.0,
                      color: context.read<ThemeCubit>().isDarkTheme
                          ? kWhiteColor
                          : kLightTextColor,
                    ),
                  ),
                ),
              );
            },
          ),

          const SizedBox(height: 16.0),

          // sign in button
          BlocBuilder<AuthCubit, AuthStates>(
            builder: (context, state) {
              if (state is AuthLoadingState) {
                return const SizedBox(
                  height: 55,
                  child: Center(child: CircularProgressIndicator()),
                );
              } else {
                return DefaultButton(
                  onPressed: () => cubit.signInUser(),
                  btnText: 'Sign In',
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
