import 'package:app/Features/Auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:app/Features/Auth/presentation/widgets/register_widgets/register_view_body.dart';
import 'package:app/core/constants/constants.dart';
import 'package:app/core/functions/show_toast_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is RegisterFailureState) {
          _onFailure(state.errMessage);
        } else if (state is RegisterSuccessState) {
          _onSuccess(state.successMessage, context);
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
    Navigator.pop(context);
  }

  void _onFailure(String errMessage) {
    showToastMessage(
      errMessage,
      backgroundColor: kRedColor,
    );
  }
}
