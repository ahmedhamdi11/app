import 'package:app/core/constants/constants.dart';
import 'package:app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

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
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: MaterialButton(
        height: 55,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        onPressed: onPressed,
        color: kPrimaryColor,
        child: Text(
          btnText,
          style: AppStyles.text18,
        ),
      ),
    );
  }
}
