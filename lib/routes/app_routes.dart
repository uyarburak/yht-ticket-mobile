part of 'app_pages.dart';

abstract class Routes {
  static const SPLASH = _Paths.SPLASH;

  static const LOGIN = _Paths.LOGIN;
  static String LOGIN_THEN(String afterSuccessfulLogin) =>
      '$LOGIN?then=${Uri.encodeQueryComponent(afterSuccessfulLogin)}';
  static const FORGOT_PASSWORD = _Paths.FORGOT_PASSWORD;
  static const REGISTER = _Paths.REGISTER;

  static const DASHBOARD = _Paths.DASHBOARD;
  static const HISTORY = _Paths.HISTORY;
  static const PROFILE = _Paths.PROFILE;

  static const NOTIFICATIONS = _Paths.NOTIFICATIONS;
  static const SCHEDULES = _Paths.SCHEDULES;
}

abstract class _Paths {
  static const SPLASH = '/splash';

  static const LOGIN = '/login';
  static const FORGOT_PASSWORD = "/forgot-password";
  static const REGISTER = "/register";

  static const DASHBOARD = '/dashboard';
  static const HISTORY = '/history';
  static const PROFILE = '/profile';

  static const NOTIFICATIONS = '/notifications';
  static const SCHEDULES = '/schedules';
}
