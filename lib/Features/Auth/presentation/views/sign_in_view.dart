import 'package:app/Features/Auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:app/Features/Auth/presentation/widgets/sign_in_view_body.dart';
import 'package:app/core/constants/constants.dart';
import 'package:app/core/functions/show_toast_message.dart';
import 'package:app/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is SignInUserFailureState) {
          _onSignInFailure(state.errMessage);
        } else if (state is SignInUserSuccessState) {
          _onSignInSuccess(state.successMessage, context);
        } else if (state is SignInWithGoogleFailureState) {
          _onSignInFailure(state.errMessage);
        } else if (state is SignInWithGoogleSuccessState) {
          _onSignInSuccess(
            'Welcome Back ${state.userCredential.user!.displayName}',
            context,
          );
        }
      },
      child: const Scaffold(
        resizeToAvoidBottomInset: false,
        body: SignInViewBody(),
      ),
    );
  }

  void _onSignInSuccess(String successMessage, BuildContext context) {
    showToastMessage(
      successMessage,
      backgroundColor: kPrimaryColor,
    );
    GoRouter.of(context).pushReplacement(AppRouter.mainPageViewPath);
  }

  void _onSignInFailure(String errMessage) {
    showToastMessage(
      errMessage,
      backgroundColor: kRedColor,
    );
  }
}
