import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
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

  runApp(GetMaterialApp.router(
    debugShowCheckedModeBanner: false,
    enableLog: true,
    unknownRoute:
        GetPage(name: '/notfound', page: () => const NotFoundScreen()),
    defaultTransition: Transition.fade,
    getPages: AppPages.routes,
    initialBinding: AppBinding(),
    smartManagement: SmartManagement.keepFactory,
    title: 'YHT Bilet Alarm',
    theme: AppTheme.lightTheme,
    locale: const Locale('tr', 'TR'),
    fallbackLocale: const Locale('tr', 'TR'),
    builder: EasyLoading.init(),
  ));
  configLoading();
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
