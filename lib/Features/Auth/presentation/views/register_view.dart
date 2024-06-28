import 'package:app/Features/Auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:app/Features/Auth/presentation/widgets/register_widgets/register_view_body.dart';
import 'package:app/core/constants/constants.dart';
import 'package:app/core/functions/show_toast_message.dart';
import 'package:app/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is AuthFailureState) {
          _onFailure(state.errMessage);
        } else if (state is AuthSuccessState) {
          _onSuccess(state.successMessage, context);
        } else if (state is SignInWithGoogleFailureState) {
          _onFailure(state.errMessage);
        } else if (state is SignInWithGoogleSuccessState) {
          _onSuccess(
            'Welcome Back ${state.userCredential.user!.displayName}',
            context,
          );
        }
      },
      child: const Scaffold(
        resizeToAvoidBottomInset: false,
        body: RegisterViewBody(),
      ),
    );
  }

  void _onSuccess(String successMessage, BuildContext context) {
    showToastMessage(
      successMessage,
      backgroundColor: kPrimaryColor,
    );
    GoRouter.of(context).pushReplacement(AppRouter.mainPageViewPath);
  }

  void _onFailure(String errMessage) {
    showToastMessage(
      errMessage,
      backgroundColor: kRedColor,
    );
  }
}
