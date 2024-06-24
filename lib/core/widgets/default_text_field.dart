import 'package:app/core/constants/constants.dart';
import 'package:app/core/manager/theme_cubit/theme_cubit.dart';
import 'package:app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DefaultTextField extends StatelessWidget {
  const DefaultTextField({
    super.key,
    this.hintText,
    this.isHiddenPassword = false,
    this.suffix,
    this.validator,
    this.controller,
    this.onChanged,
    this.prefix,
    this.keyboardType,
    this.maxLines = 1,
  });

  final String? hintText;
  final bool isHiddenPassword;
  final Widget? suffix;
  final Widget? prefix;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ThemeCubit>();

    OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: BorderSide(
        color: cubit.isDarkTheme ? kWhiteColor : kLightTextColor,
      ),
    );
    return TextFormField(
      maxLines: maxLines,
      obscureText: isHiddenPassword,
      validator: validator,
      controller: controller,
      onChanged: onChanged,
      keyboardType: keyboardType,
      style: TextStyle(
        color: cubit.isDarkTheme ? Colors.white : kLightTextColor,
      ),

      // text field decoration
      decoration: InputDecoration(
        border: outlineInputBorder,
        enabledBorder: outlineInputBorder,
        hintText: hintText,
        hintStyle: AppStyles.text14.copyWith(
            color: cubit.isDarkTheme ? null : kLightTextColor.withOpacity(0.3)),
        prefixIcon: prefix,
        suffixIcon: suffix,
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 22,
          vertical: 16,
        ),
      ),
    );
  }
}
