import 'package:app/core/constants/constants.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

class NotificationServices {
  static final _awesomeNotifications = AwesomeNotifications();

  static String basicChannelKey = 'basic_channel';

  static Future<void> initializeNotification() async {
    await _awesomeNotifications.initialize(
      null,
      [
        NotificationChannel(
          channelKey: basicChannelKey,
          channelName: 'Basic Notifications',
          channelDescription: 'Basic Notification channel',
          importance: NotificationImportance.Max,
          channelShowBadge: true,
          playSound: true,
          enableVibration: true,
          enableLights: true,
          defaultColor: kPrimaryColor,
        ),
      ],
    );
  }

  static Future<void> showNotification({
    required final String title,
    required final String body,
    required final String channelKey,
    final ActionType actionType = ActionType.Default,
    final NotificationLayout notificationLayout = NotificationLayout.Default,
    final String? bigPicture,
    final List<NotificationActionButton>? actionButtons,
    final bool scheduled = false,
    final int? scheduledMinute,
    final int? scheduledHour,
    final NotificationCategory? category,
    final bool locked = false,
  }) async {
    await _awesomeNotifications.createNotification(
      content: NotificationContent(
        id: -1,
        channelKey: channelKey,
        title: title,
        body: body,
        actionType: actionType,
        notificationLayout: notificationLayout,
        bigPicture: bigPicture,
        category: category,
        color: kPrimaryColor,
        locked: locked,
      ),
      actionButtons: actionButtons,
      schedule: scheduled
          ? NotificationCalendar(
              repeats: true,
              allowWhileIdle: true,
              preciseAlarm: true,
              second: 0,
              millisecond: 0,
              minute: scheduledMinute,
              hour: scheduledHour,
            )
          : null,
    );
  }
}
