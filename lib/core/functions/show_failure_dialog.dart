import 'package:app/core/constants/constants.dart';
import 'package:app/core/manager/theme_cubit/theme_cubit.dart';
import 'package:app/core/utils/app_styles.dart';
import 'package:app/core/widgets/default_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<dynamic> showFailureDialog(BuildContext context, String errMessage) {
  return showDialog(
    context: context,
    builder: (context) => DefaultAlertDialog(
      content: Text(
        errMessage,
        style: AppStyles.text14.copyWith(
            color: context.read<ThemeCubit>().isDarkTheme
                ? null
                : kLightTextColor),
      ),
      title: Text(
        'Error',
        style: AppStyles.text20.copyWith(color: kRedColor),
      ),
    ),
  );
}
