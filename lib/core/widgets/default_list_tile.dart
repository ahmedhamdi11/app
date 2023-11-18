import 'package:app/core/constants/constants.dart';
import 'package:flutter/material.dart';

class DefaultListTile extends StatelessWidget {
  const DefaultListTile({
    super.key,
    this.onTap,
    required this.title,
    required this.leadingIcon,
  });

  final Widget title;
  final IconData leadingIcon;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        title: title,
        leading: Icon(
          leadingIcon,
          color: kPrimaryColor,
        ),
        onTap: onTap,
      ),
    );
  }
}
