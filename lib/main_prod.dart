import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '/app/my_app.dart';
import '/flavors/build_config.dart';
import '/flavors/env_config.dart';
import '/flavors/environment.dart';
import 'app/data/local/preference/preference_manager.dart';
import 'app/data/local/preference/preference_manager_impl.dart';
import 'app/data/service/auth_service.dart';
import 'app/data/service/common_service.dart';
import 'app/data/service/setting_service.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  Logger().i("Handling a background message: ${message.messageId}");
}

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  EnvConfig prodConfig = EnvConfig(
    appName: "Flutter GetX Template Prod",
    baseUrl: "https://api.dev.dp-cargo.com",
    shouldCollectCrashLog: true,
  );
   //await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,name: 'cargo');
  //
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.red,
    statusBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.dark,
  ));
  BuildConfig.instantiate(
    envType: Environment.PRODUCTION,
    envConfig: prodConfig,
  );

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Get.putAsync<PreferenceManager>(() => PreferenceManagerImpl().init(), tag: (PreferenceManager).toString());
  await Get.putAsync(() => AuthService().init(), permanent: true);
  await Get.putAsync(() => SettingService().init(), permanent: true);
  await Get.putAsync(() => CommonApi().init());
  // await Get.putAsync(() => NotificationService().init());
  runApp(const MyApp());
}
