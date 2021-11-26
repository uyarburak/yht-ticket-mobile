import 'package:get/get.dart';
import 'package:yht_ticket/modules/forgot_password/forgot_password_binding.dart';
import 'package:yht_ticket/modules/forgot_password/forgot_password_screen.dart';
import 'package:yht_ticket/modules/login/login_binding.dart';
import 'package:yht_ticket/modules/login/login_screen.dart';
import 'package:yht_ticket/modules/register/register_binding.dart';
import 'package:yht_ticket/modules/register/register_screen.dart';
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
  ];
}
