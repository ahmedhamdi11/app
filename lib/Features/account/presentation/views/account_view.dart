import 'package:app/Features/account/presentation/widgets/app_settings.dart';
import 'package:app/Features/account/presentation/widgets/other_settings.dart';
import 'package:app/Features/account/presentation/widgets/user_account_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: const [
        FadeEffect(),
      ],
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        children: const [
          SizedBox(height: 22),
          UserAccountDetails(),
          SizedBox(height: 32),
          AppSettings(),
          SizedBox(height: 32),
          OtherSettings(),
        ],
      ),
    );
  }
}
