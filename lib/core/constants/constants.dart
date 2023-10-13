import 'package:flutter/material.dart';

const kBaseUrl = 'https://ahmedhamdi11.azurewebsites.net';

// end points
const kPhishingEmailEndPoint = '/phising_email_detection';
const kFraudsDetectionEndPoint = '/frauds_detection';
const kAttackDetectionEndPoint = '/attack_detection';
const kMalwareDetectionEndPoint = '/malware_detection';

// colors
const kPrimaryColor = Color(0xff62FCD7);
const kGradientColor = LinearGradient(
  colors: [
    Color(0xff3A6073),
    Color(0xff1B2725),
  ],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);
