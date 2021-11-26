import 'package:get/get.dart';
import 'package:yht_ticket/modules/dashboard/dashboard_binding.dart';
import 'package:yht_ticket/modules/dashboard/dashboard_screen.dart';
import 'package:yht_ticket/modules/forgot_password/forgot_password_binding.dart';
import 'package:yht_ticket/modules/forgot_password/forgot_password_screen.dart';
import 'package:yht_ticket/modules/history/history_binding.dart';
import 'package:yht_ticket/modules/history/history_screen.dart';
import 'package:yht_ticket/modules/home/home_view.dart';
import 'package:yht_ticket/modules/login/login_binding.dart';
import 'package:yht_ticket/modules/login/login_screen.dart';
import 'package:yht_ticket/modules/profile/profile_binding.dart';
import 'package:yht_ticket/modules/profile/profile_screen.dart';
import 'package:yht_ticket/modules/register/register_binding.dart';
import 'package:yht_ticket/modules/register/register_screen.dart';
import 'package:yht_ticket/modules/root/root_view.dart';
import 'package:yht_ticket/modules/splash/splash_binding.dart';
import 'package:yht_ticket/modules/splash/splash_screen.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: '/',
      page: () => RootView(),
      participatesInRootNavigator: true,
      preventDuplicates: true,
      children: [
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
          preventDuplicates: true,
          name: _Paths.HOME,
          page: () => const HomeView(),
          title: null,
          children: [
            GetPage(
              name: _Paths.DASHBOARD,
              page: () => const DashboardScreen(),
              binding: DashboardBinding(),
            ),
            GetPage(
              name: _Paths.HISTORY,
              page: () => const HistoryScreen(),
              binding: HistoryBinding(),
            ),
            GetPage(
              name: _Paths.PROFILE,
              page: () => const ProfileScreen(),
              binding: ProfileBinding(),
            ),
          ],
        ),
      ],
    ),
  ];
}
