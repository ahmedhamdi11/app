import 'package:app/core/widgets/default_alert_dialog.dart';
import 'package:flutter/material.dart';

Future<dynamic> showFailureDialog(BuildContext context, String errMessage) {
  return showDialog(
    context: context,
    builder: (context) => DefaultAlertDialog(
      content: Text(errMessage),
      title: const Text(
        'Error',
        style: TextStyle(color: Colors.red),
      ),
    ),
  );
}
