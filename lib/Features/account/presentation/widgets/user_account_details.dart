import 'package:app/Features/Auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:app/core/constants/constants.dart';
import 'package:app/core/functions/show_toast_message.dart';
import 'package:app/core/utils/app_router.dart';
import 'package:app/core/utils/app_styles.dart';
import 'package:app/core/widgets/svg_icon_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
    final currentUser = FirebaseAuth.instance.currentUser!;

    return BlocListener<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is SignOutUserFailureState) {
          _onSignOuFailure(state.errMessage, context);
        } else if (state is SignOutUserSuccessState) {
          _onSignOuSuccess(state.successMessage, context);
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        decoration: BoxDecoration(
          color: kCardColor,
          borderRadius: BorderRadius.circular(28),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 32,
              backgroundColor: kIconsBackgroundColor,
              backgroundImage: currentUser.photoURL != null
                  ? CachedNetworkImageProvider(
                      currentUser.photoURL!,
                    )
                  : null,
              child: currentUser.photoURL != null
                  ? null
                  : const SvgIconWidget(
                      iconPath: 'assets/icons/account_icon.svg',
                    ),
            ),
            const SizedBox(width: 18),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  currentUser.displayName != null
                      ? currentUser.displayName!
                      : 'username',
                  style: AppStyles.text22.copyWith(
                    color: kWhiteColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  currentUser.email != null ? currentUser.email! : 'email',
                  style: AppStyles.text18.copyWith(
                    color: kWhiteColor.withOpacity(0.6),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
