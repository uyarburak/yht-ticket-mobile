import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:yht_ticket/app_binding.dart';
import 'package:yht_ticket/di.dart';
import 'package:yht_ticket/modules/not_found/not_found_screen.dart';
import 'package:yht_ticket/routes/app_pages.dart';
import 'package:yht_ticket/shared/constants/colors.dart';
import 'package:yht_ticket/theme/theme_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DenpendencyInjection.init();

  await initializeDateFormatting('tr_TR', null);

  //Remove this method to stop OneSignal Debugging
  OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

  OneSignal.shared.setAppId("4042c904-a960-4692-b889-511bfcdee887");

  // Setting External User Id with Callback Available in SDK Version 3.9.3+
  OneSignal.shared.setExternalUserId("burak").then((results) {
    print(results.toString());
  }).catchError((error) {
    print(error.toString());
  });

  // The promptForPushNotificationsWithUserResponse function will show the iOS push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
  OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
    print("Accepted permission: $accepted");
  });

  OneSignal.shared
      .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
    // Will be called whenever a notification is opened/button pressed.
    print(result.notification.rawPayload);
  });

  runApp(App());
  configLoading();
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      enableLog: true,
      unknownRoute:
          GetPage(name: '/notfound', page: () => const NotFoundScreen()),
      initialRoute: Routes.SPLASH,
      defaultTransition: Transition.fade,
      getPages: AppPages.routes,
      initialBinding: AppBinding(),
      smartManagement: SmartManagement.keepFactory,
      title: 'YHT Bilet Alarm',
      theme: AppTheme.lightTheme,
      locale: const Locale('tr', 'TR'),
      fallbackLocale: const Locale('tr', 'TR'),
      builder: EasyLoading.init(),
    );
  }
}

void configLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.threeBounce
    ..loadingStyle = EasyLoadingStyle.custom
    // ..indicatorSize = 45.0
    ..radius = 10.0
    // ..progressColor = Colors.yellow
    ..backgroundColor = ColorConstants.lightGray
    ..indicatorColor = hexToColor('#64DEE0')
    ..textColor = hexToColor('#64DEE0')
    // ..maskColor = Colors.red
    ..userInteractions = false
    ..dismissOnTap = false
    ..animationStyle = EasyLoadingAnimationStyle.scale;
}
