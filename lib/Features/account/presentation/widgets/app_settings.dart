import 'package:app/Features/account/manager/notifications_cubit/notifications_cubit_cubit.dart';
import 'package:app/core/constants/constants.dart';
import 'package:app/core/manager/theme_cubit/theme_cubit.dart';
import 'package:app/core/utils/app_styles.dart';
import 'package:app/core/widgets/default_switch_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppSettings extends StatelessWidget {
  const AppSettings({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ThemeCubit>();
    final notificationsCubit = context.read<NotificationsCubit>();

    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'App Settings',
              style: AppStyles.text20.copyWith(
                color: cubit.isDarkTheme ? kWhiteColor : kLightTextColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsetsDirectional.only(
                top: 14,
                bottom: 14,
                start: 16,
                end: 12,
              ),
              decoration: BoxDecoration(
                color: cubit.isDarkTheme ? kCardColor : kLightCardColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Material(
                color: Colors.transparent,
                child: Column(
                  children: [
                    // theme switch
                    DefaultSwitchTile(
                      value: cubit.isDarkTheme,
                      titleText: "Dark Theme",
                      onChanged: (value) => cubit.changeTheme(value),
                      icon: Icon(
                        cubit.isDarkTheme ? Icons.dark_mode : Icons.light_mode,
                        color: cubit.isDarkTheme
                            ? kIconsBackgroundColor
                            : kLightTextColor,
                      ),
                    ),

                    const SizedBox(height: 16),

                    // notifications switch
                    BlocBuilder<NotificationsCubit, NotificationsStates>(
                      builder: (context, state) {
                        return DefaultSwitchTile(
                          value: notificationsCubit.receiveNotifications,
                          titleText: "Receive Notifications",
                          onChanged: (value) => notificationsCubit
                              .onReceiveNotificationsChanged(value),
                          icon: Icon(
                            Icons.notifications_active,
                            color: cubit.isDarkTheme
                                ? kIconsBackgroundColor
                                : kLightTextColor,
                          ),
                        );
                      },
                    ),

                    BlocBuilder<NotificationsCubit, NotificationsStates>(
                      builder: (context, state) {
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          height:
                              notificationsCubit.receiveNotifications ? 0 : 22,
                          alignment: Alignment.center,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'you won\'t receive any alerts and notifications',
                              style: AppStyles.text14.copyWith(
                                color: cubit.isDarkTheme
                                    ? kRedColor
                                    : Colors.red.shade900,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
