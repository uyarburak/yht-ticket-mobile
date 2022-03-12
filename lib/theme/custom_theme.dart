import 'package:flutter/material.dart';

class CustomTheme {
  static const Color occur = Color(0xffb38220);
  static const Color peach = Color(0xffe09c5f);
  static const Color skyBlue = Color(0xff639fdc);
  static const Color darkGreen = Color(0xff226e79);
  static const Color red = Color(0xfff8575e);
  static const Color purple = Color(0xff9f50bf);
  static const Color pink = Color(0xffd17b88);
  static const Color brown = Color(0xffbd631a);
  static const Color blue = Color(0xff1a71bd);
  static const Color green = Color(0xff068425);
  static const Color yellow = Color(0xfffff44f);
  static const Color orange = Color(0xffFFA500);

  final Color card,
      cardDark,
      border,
      borderDark,
      disabledColor,
      onDisabled,
      colorInfo,
      colorWarning,
      colorSuccess,
      colorError,
      shadowColor,
      onInfo,
      onWarning,
      onSuccess,
      onError,
      shimmerBaseColor,
      shimmerHighlightColor;

  CustomTheme({
    this.border = const Color(0xffeeeeee),
    this.borderDark = const Color(0xffe6e6e6),
    this.card = const Color(0xfff0f0f0),
    this.cardDark = const Color(0xfffefefe),
    this.disabledColor = const Color(0xffdcc7ff),
    this.onDisabled = const Color(0xffffffff),
    this.colorWarning = const Color(0xffffc837),
    this.colorInfo = const Color(0xffff784b),
    this.colorSuccess = const Color(0xff3cd278),
    this.shadowColor = const Color(0xff1f1f1f),
    this.onInfo = const Color(0xffffffff),
    this.onWarning = const Color(0xffffffff),
    this.onSuccess = const Color(0xffffffff),
    this.colorError = const Color(0xfff0323c),
    this.onError = const Color(0xffffffff),
    this.shimmerBaseColor = const Color(0xFFF5F5F5),
    this.shimmerHighlightColor = const Color(0xFFE0E0E0),
  });

  //--------------------------------------  Custom App Theme ----------------------------------------//

  static final CustomTheme lightCustomTheme = CustomTheme(
      card: const Color(0xfff6f6f6),
      cardDark: const Color(0xfff0f0f0),
      disabledColor: const Color(0xff636363),
      onDisabled: const Color(0xffffffff),
      colorInfo: const Color(0xffff784b),
      colorWarning: const Color(0xffffc837),
      colorSuccess: const Color(0xff3cd278),
      shadowColor: const Color(0xffd9d9d9),
      onInfo: const Color(0xffffffff),
      onSuccess: const Color(0xffffffff),
      onWarning: const Color(0xffffffff),
      colorError: const Color(0xfff0323c),
      onError: const Color(0xffffffff),
      shimmerBaseColor: const Color(0xFFF5F5F5),
      shimmerHighlightColor: const Color(0xFFE0E0E0));

  static final CustomTheme darkCustomTheme = CustomTheme(
      card: const Color(0xff222327),
      cardDark: const Color(0xff101010),
      border: const Color(0xff303030),
      borderDark: const Color(0xff363636),
      disabledColor: const Color(0xffbababa),
      onDisabled: const Color(0xff000000),
      colorInfo: const Color(0xffff784b),
      colorWarning: const Color(0xffffc837),
      colorSuccess: const Color(0xff3cd278),
      shadowColor: const Color(0xff202020),
      onInfo: const Color(0xffffffff),
      onSuccess: const Color(0xffffffff),
      onWarning: const Color(0xffffffff),
      colorError: const Color(0xfff0323c),
      onError: const Color(0xffffffff),
      shimmerBaseColor: const Color(0xFF1a1a1a),
      shimmerHighlightColor: const Color(0xFF454545));
}
