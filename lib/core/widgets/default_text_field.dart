import 'package:app/core/constants/constants.dart';
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
    this.fillColor,
    this.keyboardType,
    // this.textInputColor = kDarkTextColor,
  });

  final String? hintText;
  final bool isHiddenPassword;
  final Widget? suffix;
  final Widget? prefix;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final Color? fillColor;
  final TextInputType? keyboardType;
  // final Color textInputColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isHiddenPassword,
      validator: validator,
      controller: controller,
      onChanged: onChanged,
      keyboardType: keyboardType,
      style: const TextStyle(color: Colors.white),
      // text field decoration
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: fillColor ?? kPrimaryColor.withOpacity(0.18),
        hintText: hintText,
        hintStyle: const TextStyle(fontSize: 14.5),
        prefixIcon: prefix,
        suffixIcon: suffix,
        isDense: true,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 18, vertical: 18),

        // suffixIconConstraints: BoxConstraints(
        //   minHeight: 35,
        //   minWidth: 48,
        // ),
      ),
    );
  }
}
