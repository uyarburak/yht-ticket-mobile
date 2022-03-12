/*
* File : App Theme
* Version : 1.0.0
* */

// Copyright 2021 The FlutX Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/// [FxAppThemeType.dark] - Applies all the properties for dark theme
/// [FxAppThemeType.light] - Applies all the properties for light theme

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum FxAppThemeType { light, dark }

class FxAppTheme {
  static FxAppThemeType defaultThemeType = FxAppThemeType.light;

  static TextDirection _textDirection = TextDirection.ltr;

  // ignore: unnecessary_getters_setters
  static TextDirection get textDirection => _textDirection;

  // ignore: unnecessary_getters_setters
  static set textDirection(TextDirection textDirection) {
    _textDirection = textDirection;
  }

  static ThemeData get theme => FxAppTheme.getThemeFromThemeMode();

  static ThemeData lightTheme = ThemeData.light().copyWith(
    brightness: Brightness.light,
    primaryColor: const Color(0xff3d63ff),
    canvasColor: Colors.transparent,
    backgroundColor: const Color(0xfff6f6f6),
    scaffoldBackgroundColor: const Color(0xfff6f6f6),
    appBarTheme: const AppBarTheme(
      actionsIconTheme: IconThemeData(
        color: Color(0xff495057),
      ),
      color: Color(0xffffffff),
      iconTheme: IconThemeData(color: Color(0xff495057), size: 24),
    ),
    navigationRailTheme: const NavigationRailThemeData(
        selectedIconTheme:
            IconThemeData(color: Color(0xff3d63ff), opacity: 1, size: 24),
        unselectedIconTheme:
            IconThemeData(color: Color(0xff495057), opacity: 1, size: 24),
        backgroundColor: Color(0xffffffff),
        elevation: 3,
        selectedLabelTextStyle: TextStyle(color: Color(0xff3d63ff)),
        unselectedLabelTextStyle: TextStyle(color: Color(0xff495057))),
    colorScheme: const ColorScheme.light(
        primary: Color(0xff3d63ff),
        onPrimary: Colors.white,
        primaryVariant: Color(0xff0055ff),
        secondary: Color(0xff495057),
        secondaryVariant: Color(0xff3cd278),
        onSecondary: Colors.white,
        surface: Color(0xffe2e7f1),
        background: Color(0xfffefefe),
        onBackground: Color(0xff495057)),
    cardTheme: CardTheme(
      color: Colors.white,
      shadowColor: Colors.black.withOpacity(0.4),
      elevation: 1,
      margin: const EdgeInsets.all(0),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      fillColor: Color(0xfff5f5f5),
      hintStyle: TextStyle(fontSize: 15, color: Color(0xaa495057)),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        borderSide: BorderSide(width: 1, color: Color(0xff3d63ff)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        borderSide: BorderSide(width: 1, color: Colors.black54),
      ),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1, color: Colors.black54)),
    ),
    splashColor: Colors.white.withAlpha(100),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    indicatorColor: Colors.white,
    disabledColor: const Color(0xffdcc7ff),
    highlightColor: Colors.white,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: const Color(0xff3d63ff),
        splashColor: Colors.white.withAlpha(100),
        highlightElevation: 8,
        elevation: 4,
        focusColor: const Color(0xff3d63ff),
        hoverColor: const Color(0xff3d63ff),
        foregroundColor: Colors.white),
    dividerColor: const Color(0xffd1d1d1),
    errorColor: const Color(0xfff0323c),
    cardColor: Colors.white,
    popupMenuTheme: const PopupMenuThemeData(
      color: Color(0xffffffff),
    ),
    bottomAppBarTheme:
        const BottomAppBarTheme(color: Color(0xffffffff), elevation: 2),
    tabBarTheme: const TabBarTheme(
      unselectedLabelColor: Color(0xff495057),
      labelColor: Color(0xff3d63ff),
      indicatorSize: TabBarIndicatorSize.label,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: Color(0xff3d63ff), width: 2.0),
      ),
    ),
    sliderTheme: SliderThemeData(
      activeTrackColor: const Color(0xff3d63ff),
      inactiveTrackColor: const Color(0xff3d63ff).withAlpha(140),
      trackShape: const RoundedRectSliderTrackShape(),
      trackHeight: 4.0,
      thumbColor: const Color(0xff3d63ff),
      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10.0),
      overlayShape: const RoundSliderOverlayShape(overlayRadius: 24.0),
      tickMarkShape: const RoundSliderTickMarkShape(),
      inactiveTickMarkColor: Colors.red[100],
      valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
      valueIndicatorTextStyle: const TextStyle(
        color: Colors.white,
      ),
    ),
  );
  static ThemeData darkTheme = ThemeData.dark().copyWith(
      brightness: Brightness.dark,
      canvasColor: Colors.transparent,
      primaryColor: const Color(0xff3d63ff),
      scaffoldBackgroundColor: const Color(0xff1b1b1b),
      backgroundColor: const Color(0xff252525),
      appBarTheme: const AppBarTheme(
        actionsIconTheme: IconThemeData(
          color: Color(0xffffffff),
        ),
        color: Color(0xff2e343b),
        iconTheme: IconThemeData(color: Color(0xffffffff), size: 24),
      ),
      colorScheme: const ColorScheme.dark(
        primary: Color(0xff3d63ff),
        primaryVariant: Color(0xff3d63ff),
        secondary: Color(0xff00cc77),
        secondaryVariant: Color(0xff00cc77),
        background: Color(0xff252525),
        onPrimary: Colors.white,
        onBackground: Colors.white,
        onSecondary: Colors.white,
        surface: Color(0xff585e63),
      ),
      cardTheme: const CardTheme(
        color: Color(0xff37404a),
        shadowColor: Color(0xff000000),
        elevation: 1,
        margin: EdgeInsets.all(0),
      ),
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      indicatorColor: Colors.white,
      disabledColor: const Color(0xffa3a3a3),
      highlightColor: Colors.white,
      inputDecorationTheme: const InputDecorationTheme(
        fillColor: Color(0xff3E444A),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1, color: Color(0xff3d63ff)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1, color: Colors.white70),
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(width: 1, color: Colors.white70)),
      ),
      dividerColor: const Color(0xff363636),
      errorColor: Colors.orange,
      cardColor: const Color(0xff282a2b),
      splashColor: Colors.white.withAlpha(100),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: const Color(0xff3d63ff),
          splashColor: Colors.white.withAlpha(100),
          highlightElevation: 8,
          elevation: 4,
          focusColor: const Color(0xff3d63ff),
          hoverColor: const Color(0xff3d63ff),
          foregroundColor: Colors.white),
      popupMenuTheme: const PopupMenuThemeData(
        color: Color(0xff37404a),
      ),
      bottomAppBarTheme:
          const BottomAppBarTheme(color: Color(0xff464c52), elevation: 2),
      tabBarTheme: const TabBarTheme(
        unselectedLabelColor: Color(0xff495057),
        labelColor: Color(0xff3d63ff),
        indicatorSize: TabBarIndicatorSize.label,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(color: Color(0xff3d63ff), width: 2.0),
        ),
      ),
      sliderTheme: SliderThemeData(
        activeTrackColor: const Color(0xff3d63ff),
        inactiveTrackColor: const Color(0xff3d63ff).withAlpha(100),
        trackShape: const RoundedRectSliderTrackShape(),
        trackHeight: 4.0,
        thumbColor: const Color(0xff3d63ff),
        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10.0),
        overlayShape: const RoundSliderOverlayShape(overlayRadius: 24.0),
        tickMarkShape: const RoundSliderTickMarkShape(),
        inactiveTickMarkColor: Colors.red[100],
        valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
        valueIndicatorTextStyle: const TextStyle(
          color: Colors.white,
        ),
      ),
      cupertinoOverrideTheme: const CupertinoThemeData());

  static ThemeData getThemeFromThemeMode({FxAppThemeType? themeType}) {
    themeType ??= defaultThemeType;

    switch (themeType) {
      case FxAppThemeType.light:
        return lightTheme;
      default:
        return darkTheme;
    }
  }

  static void changeLightTheme(ThemeData themeData) {
    lightTheme = themeData;
  }

  static void changeDarkTheme(ThemeData themeData) {
    darkTheme = themeData;
  }

  static void changeThemeType(FxAppThemeType? themeType) {
    defaultThemeType = themeType!;
  }
}
