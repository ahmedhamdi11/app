import 'package:app/core/functions/launch_url_in_browser.dart';

void openWhatsappContact({String? initMessage}) {
  String phoneNumber = '+201146321482';
  String initialMessage = initMessage ?? '';
  appUrlLauncher(
    url: 'https://wa.me/$phoneNumber?text=$initialMessage',
  );
}
