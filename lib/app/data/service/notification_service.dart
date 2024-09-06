import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:flutter_local_notifications/src/platform_specifics/android/enums.dart' as enums;
import 'package:logger/logger.dart';


class NotificationService extends GetxService {
  String? token;

  //Singleton pattern
  static final NotificationService _notificationService = NotificationService._internal();

  factory NotificationService() {
    return _notificationService;
  }

  NotificationService._internal();

  //instance of FlutterLocalNotificationsPlugin
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  void _requestIOSPermission() async {
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(alert: true, badge: true, sound: true);
  }

  void onDidReceiveLocalNotification(int id, String? title, String? body, String? payload) async {
    // display a dialog with the notification details, tap ok to go to another page
    Logger().d('onDidReceiveLocalNotification ===>');
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(title ?? ''),
        content: Text(body ?? ''),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            child: const Text('Ok'),
            onPressed: () async {
              Navigator.of(context, rootNavigator: true).pop();
            },
          )
        ],
      ),
    );
  }

  Future<NotificationService> init() async {
    //Initialization Settings for Android
    const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('launcher_icon');

    //Initialization Settings for iOS
    final DarwinInitializationSettings initializationSettingsIOS = DarwinInitializationSettings(
        requestSoundPermission: false,
        requestBadgePermission: false,
        requestAlertPermission: false,
        onDidReceiveLocalNotification: onDidReceiveLocalNotification);

    //InitializationSettings for initializing settings for both platforms (Android & iOS)
    final InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

    await flutterLocalNotificationsPlugin
        .initialize(initializationSettings, onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
            onDidReceiveNotificationResponse: (response) {
      Logger().d('onDidReceiveNotificationResponse');
    });

    _requestIOSPermission();

    await _configFirebaseNotification();

    fcmSubscribe('all');
    setup();

    return this;
  }

  void setup() {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      Logger().i('Got a onMessageOpenedApp whilst in the foreground!');
    });
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      Logger().i('Got a message whilst in the foreground!');
      NotificationService().showNotification(message);
    });
    setupInteractedMessage();
  }

  Future<void> setupInteractedMessage() async {
    RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {}
  }

  void fcmSubscribe(String topic) {
    FirebaseMessaging.instance.subscribeToTopic(topic);
  }

  void fcmUnSubscribe(String topic) {
    FirebaseMessaging.instance.unsubscribeFromTopic(topic);
  }

  Future<void> _configFirebaseNotification() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    try {
      await messaging.getToken().then((value) {
        Logger().i("token ==========> $value");
        token = value;
      });
      messaging.onTokenRefresh.listen((firebaseToken) {
        token = firebaseToken;
      });
    } catch (e) {
      Logger().e(e.toString());
    }
    await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  }

  void showNotification(RemoteMessage message) async {
    RemoteNotification? notification = message.notification;
    await flutterLocalNotificationsPlugin.show(notification.hashCode, notification?.title, notification?.body,
        NotificationDetails(android: _androidNotificationDetails, iOS: _iosNotificationDetails),
        payload: notification?.title);
  }

  final AndroidNotificationDetails _androidNotificationDetails = const AndroidNotificationDetails(
      'channelId', "channelName",
      channelDescription: "channelDescription",
      playSound: true,
      priority: enums.Priority.high,
      importance: Importance.high);

  final DarwinNotificationDetails _iosNotificationDetails =
      const DarwinNotificationDetails(threadIdentifier: 'thread_id');
}

@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse notificationResponse) {
  // ignore: avoid_print
  print('notification(${notificationResponse.id}) action tapped: '
      '${notificationResponse.actionId} with'
      ' payload: ${notificationResponse.payload}');
  if (notificationResponse.input?.isNotEmpty ?? false) {
    // ignore: avoid_print
    print('notification action tapped with input: ${notificationResponse.input}');
  }
}
