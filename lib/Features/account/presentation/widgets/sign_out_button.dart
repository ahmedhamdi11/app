import 'package:app/Features/Auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:app/core/constants/constants.dart';
import 'package:app/core/utils/app_styles.dart';
import 'package:app/core/widgets/default_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignOutButton extends StatelessWidget {
  const SignOutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        showDialog(
          context: context,
          builder: (context) => DefaultAlertDialog(
            title: Text(
              'Sign out',
              style: AppStyles.text18.copyWith(color: kWhiteColor),
            ),
            content: Text(
              'Are you sure you want to sign out?',
              style: AppStyles.text14.copyWith(
                color: kWhiteColor.withOpacity(0.6),
              ),
            ),
            actions: [
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: kRedColor,
                ),
                onPressed: () {
                  BlocProvider.of<AuthCubit>(context).singOutUser(context);
                },
                child: Text(
                  'sign out',
                  style: AppStyles.text14.copyWith(color: kRedColor),
                ),
              ),
              OutlinedButton(
                onPressed: () => GoRouter.of(context).pop(),
                child: Text(
                  'cancel',
                  style: AppStyles.text14.copyWith(color: kPrimaryColor),
                ),
              )
            ],
          ),
        );
      },
      icon: const Icon(
        Icons.logout_outlined,
        color: kWhiteColor,
      ),
    );
  }
}
