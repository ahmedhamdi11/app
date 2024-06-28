import 'package:app/Features/Auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:app/core/widgets/default_button.dart';
import 'package:app/core/widgets/default_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({
    super.key,
  });

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  @override
  void initState() {
    BlocProvider.of<AuthCubit>(context).registerFormKey =
        GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AuthCubit cubit = BlocProvider.of<AuthCubit>(context);

    return Form(
      key: cubit.registerFormKey,
      child: Column(
        children: [
          // email field
          DefaultTextField(
            hintText: 'Email',
            onChanged: (value) {
              cubit.registerEmail = value;
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
                  cubit.registerPassword = value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password.';
                  } else {
                    return null;
                  }
                },
              );
            },
          ),

          const SizedBox(height: 16.0),

          // register button
          BlocBuilder<AuthCubit, AuthStates>(
            builder: (context, state) {
              if (state is RegisterLoadingState) {
                return const SizedBox(
                  height: 55,
                  child: Center(child: CircularProgressIndicator()),
                );
              } else {
                return DefaultButton(
                  onPressed: () => cubit.registerUser(),
                  btnText: 'Register',
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
