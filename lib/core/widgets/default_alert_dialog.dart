import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
      actions: actions ??
          [
            OutlinedButton(
              onPressed: () => GoRouter.of(context).pop(),
              child: const Text('ok'),
            )
          ],
      insetPadding:
          const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
    );
  }
}
