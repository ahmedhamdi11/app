import 'package:app/Features/account/manager/notifications_cubit/notifications_cubit_cubit.dart';
import 'package:app/Features/account/presentation/widgets/app_settings.dart';
import 'package:app/Features/account/presentation/widgets/other_settings.dart';
import 'package:app/Features/account/presentation/widgets/user_account_details.dart';
import 'package:app/core/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationsCubit(
        getIt<SharedPreferences>().getBool('receive_notifications') ?? true,
      ),
      child: Animate(
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
      ),
    );
  }
}
