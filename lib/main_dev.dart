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
  EnvConfig devConfig = EnvConfig(
    appName: "Flutter GetX Template Dev",
    baseUrl: "https://api.dev.dp-cargo.com",
    shouldCollectCrashLog: true,
  );

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.red,
    statusBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.dark,
  ));
  BuildConfig.instantiate(
    envType: Environment.DEVELOPMENT,
    envConfig: devConfig,
  );
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Get.putAsync<PreferenceManager>(() => PreferenceManagerImpl().init(),
      tag: (PreferenceManager).toString());
  await Get.putAsync(() => AuthService().init());
  await Get.putAsync(() => SettingService().init(), permanent: true);
  await Get.putAsync(() => CommonApi().init());
  //await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform, name: 'vncss-dev');
  runApp(const MyApp());
}
