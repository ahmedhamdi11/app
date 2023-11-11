import 'package:app/Features/Auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:app/Features/account/presentation/widgets/sign_out_button.dart';
import 'package:app/core/constants/constants.dart';
import 'package:app/core/functions/show_toast_message.dart';
import 'package:app/core/utils/app_router.dart';
import 'package:app/core/utils/app_styles.dart';
import 'package:app/core/widgets/svg_icon_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class UserAccountDetails extends StatelessWidget {
  const UserAccountDetails({
    super.key,
  });

  void _onSignOuSuccess(String successMessage, BuildContext context) {
    showToastMessage(
      successMessage,
      backgroundColor: kPrimaryColor,
    );
    GoRouter.of(context).pushReplacement(AppRouter.signInViewPath);
  }

  void _onSignOuFailure(String errMessage, BuildContext context) {
    showToastMessage(
      errMessage,
      backgroundColor: kRedColor,
    );
    GoRouter.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is SignOutUserFailureState) {
          _onSignOuFailure(state.errMessage, context);
        } else if (state is SignOutUserSuccessState) {
          _onSignOuSuccess(state.successMessage, context);
        }
      },
      child: Row(
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
                FirebaseAuth.instance.currentUser!.displayName ?? 'Username',
                style: AppStyles.text18.copyWith(color: kWhiteColor),
              ),
              Text(
                FirebaseAuth.instance.currentUser!.email ?? 'email@google.com',
                style: AppStyles.text14.copyWith(
                  color: kWhiteColor.withOpacity(0.7),
                ),
              ),
            ],
          ),

          const Spacer(),

          // sign out
          const SignOutButton()
        ],
      ),
    );
  }
}
