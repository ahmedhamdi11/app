import 'package:app/core/constants/constants.dart';
import 'package:app/core/functions/show_toast_message.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchUrlInBrowser(
  BuildContext context, {
  required String url,
}) async {
  try {
    await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.externalApplication,
    );
  } catch (e) {
    showToastMessage('Could not launch $url', backgroundColor: kRedColor);
  }
}
