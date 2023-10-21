import 'package:flutter/material.dart';

const kBaseUrl = 'https://glory-team.azurewebsites.net';

// end points
const kPhishingEmailEndPoint = '/phising_email_detection';
const kFraudsDetectionEndPoint = '/frauds_detection';
const kAttackDetectionEndPoint = '/attack_detection';
const kMalwareDetectionEndPoint = '/malware_detection';

// colors
const kPrimaryColor = Color(0xff62FCD7);
const kErrorColor = Color(0xffFE547C);
const kSuccessColor = Colors.green;

// gradient colors
const kGradientColor = LinearGradient(
  colors: [
    Color(0xff071A3D),
    Color(0xff071A1D),
  ],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);
