import 'package:get/get.dart';
import 'package:yht_ticket/modules/login/login_binding.dart';
import 'package:yht_ticket/modules/login/login_screen.dart';
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
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
  ];
}
