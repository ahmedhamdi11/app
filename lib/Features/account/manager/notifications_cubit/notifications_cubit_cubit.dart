import 'package:app/core/services/fcm_service.dart';
import 'package:app/core/services/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'notifications_cubit_state.dart';

class NotificationsCubit extends Cubit<NotificationsStates> {
  NotificationsCubit(this.receiveNotifications)
      : super(NotificationsCubitInitial());

  bool receiveNotifications;

  void onReceiveNotificationsChanged(bool newValue) {
    // update the value
    receiveNotifications = newValue;
    emit(OnReceiveNotificationButtonChanges());

    // subscribe to the notification topic if new value is true
    if (receiveNotifications) {
      FCMService.messaging.subscribeToTopic('all');
    } else {
      FCMService.messaging.unsubscribeFromTopic('all');
      FCMService.messaging.unsubscribeFromTopic('all');
    }

    // save the selected value in the cache
    getIt<SharedPreferences>().setBool(
      "receive_notifications",
      receiveNotifications,
    );
  }
}
