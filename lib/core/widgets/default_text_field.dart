import 'package:app/core/constants/constants.dart';
import 'package:app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

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
  });

  final String? hintText;
  final bool isHiddenPassword;
  final Widget? suffix;
  final Widget? prefix;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: const BorderSide(
        color: kWhiteColor,
      ),
    );
    return TextFormField(
      obscureText: isHiddenPassword,
      validator: validator,
      controller: controller,
      onChanged: onChanged,
      keyboardType: keyboardType,
      style: const TextStyle(color: Colors.white),

      // text field decoration
      decoration: InputDecoration(
        border: outlineInputBorder,
        enabledBorder: outlineInputBorder,
        hintText: hintText,
        hintStyle: AppStyles.text14,
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
