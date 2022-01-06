import 'package:get/get.dart';
import 'package:yht_ticket/modules/forgot_password/forgot_password_binding.dart';
import 'package:yht_ticket/modules/forgot_password/forgot_password_screen.dart';
import 'package:yht_ticket/modules/home/home_binding.dart';
import 'package:yht_ticket/modules/home/home_view.dart';
import 'package:yht_ticket/modules/login/login_binding.dart';
import 'package:yht_ticket/modules/login/login_screen.dart';
import 'package:yht_ticket/modules/notifications/notifications_binding.dart';
import 'package:yht_ticket/modules/notifications/notifications_screen.dart';
import 'package:yht_ticket/modules/register/register_binding.dart';
import 'package:yht_ticket/modules/register/register_screen.dart';
import 'package:yht_ticket/modules/schedules/schedules_binding.dart';
import 'package:yht_ticket/modules/schedules/schedules_screen.dart';
import 'package:yht_ticket/modules/search_station/search_station_binding.dart';
import 'package:yht_ticket/modules/search_station/search_station_screen.dart';
import 'package:yht_ticket/modules/splash/splash_binding.dart';
import 'package:yht_ticket/modules/splash/splash_screen.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => RegisterScreen(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: Routes.FORGOT_PASSWORD,
      page: () => ForgotPasswordScreen(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => HomeView(0),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.HISTORY,
      page: () => HomeView(1),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => HomeView(2),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.NOTIFICATIONS,
      page: () => NotificationsScreen(),
      binding: NotificationsBinding(),
    ),
    GetPage(
      name: Routes.SCHEDULES,
      page: () => SchedulesScreen(),
      binding: SchedulesBinding(),
    ),
    GetPage(
      name: Routes.SEARCH_STATIONS,
      page: () => SearchStationScreen(),
      binding: SearchStationBinding(),
    ),
  ];
}
