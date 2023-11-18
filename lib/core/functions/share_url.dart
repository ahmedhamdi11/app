import 'package:app/core/constants/constants.dart';
import 'package:app/core/functions/show_toast_message.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

Future<void> shareUrl(BuildContext context, {required String url}) async {
  try {
    await Share.share(url);
  } catch (e) {
    showToastMessage(
      'Could not share $url',
      backgroundColor: kRedColor,
    );
  }
}
