import 'package:flutter/material.dart';

class DefaultAlertDialog extends StatelessWidget {
  const DefaultAlertDialog({
    super.key,
    this.title,
    this.content,
    this.actions,
  });
  final Widget? title;
  final Widget? content;
  final List<Widget>? actions;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: title,
      content: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: content,
      ),
      actions: actions,
      insetPadding:
          const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
    );
  }
}
