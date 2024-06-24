import 'package:app/core/constants/constants.dart';
import 'package:app/core/manager/theme_cubit/theme_cubit.dart';
import 'package:app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    super.key,
    this.onPressed,
    required this.btnText,
  });
  final void Function()? onPressed;
  final String btnText;
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ThemeCubit>();

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: MaterialButton(
        height: 55,
        elevation: cubit.isDarkTheme ? null : 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        onPressed: onPressed,
        color: cubit.isDarkTheme
            ? kPrimaryColor
            : kLightTextColor.withOpacity(0.75),
        child: Text(
          btnText,
          style: AppStyles.text18.copyWith(
            color: cubit.isDarkTheme ? null : kWhiteColor,
          ),
        ),
      ),
    );
  }
}
