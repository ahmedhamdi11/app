import 'package:app/core/services/notifications_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class FCMService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;

  static Future<String?> getMessagingToken() async {
    return await messaging.getToken();
  }

  static Future<void> setupInteractedMessage() async {
    RemoteMessage? initialMessage = await messaging.getInitialMessage();

    // If the message also contains a data property with a "type",
    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }

    // Also handle any interaction when the app is in the background via
    // the onMessageOpenedApp Stream listener
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  }

  static void _handleMessage(RemoteMessage message) {
    // for example navigate to specific screen
    // based on the type key from the message data
  }

  static Future<void> _backgroundMessageHandler(RemoteMessage message) async {
    debugPrint('on fcm background');
  }

  static void onBackgroundMessage() {
    FirebaseMessaging.onBackgroundMessage(_backgroundMessageHandler);
  }

  static void onForegroundMessageListener() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        final notification = message.notification;

        NotificationServices.showNotification(
          title: notification!.title ?? '',
          body: notification.body ?? '',
          channelKey: NotificationServices.basicChannelKey,
        );
      }

      debugPrint('Got an FCM message whilst in the foreground!');
    });
  }
}
