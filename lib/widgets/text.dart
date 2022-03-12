// Copyright 2021 The FlutX Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/// There are mainly 13 types of Text widgets.
/// h1,h2,h3,h4,h5,h6,sh1,sh2,b1,b2,button,caption,overline - This is the order of its size.

import 'package:flutter/material.dart';
import 'package:yht_ticket/theme/app_theme.dart';
import 'package:yht_ticket/theme/text_style.dart';

class FxText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final int? fontWeight;
  final bool muted, xMuted;
  final double? letterSpacing;
  final Color? color;
  final TextDecoration decoration;
  final double? height;
  final double wordSpacing;
  final double? fontSize;
  final FxTextType textType;

  //Text Style
  final TextAlign? textAlign;
  final int? maxLines;
  final Locale? locale;
  final TextOverflow? overflow;
  final String? semanticsLabel;
  final bool? softWrap;
  final StrutStyle? strutStyle;
  final TextDirection? textDirection;
  final TextHeightBehavior? textHeightBehavior;
  final double? textScaleFactor;
  final TextWidthBasis? textWidthBasis;

  const FxText(
    this.text, {
    Key? key,
    this.style,
    this.fontWeight = 500,
    this.muted = false,
    this.xMuted = false,
    this.letterSpacing = 0.15,
    this.color,
    this.decoration = TextDecoration.none,
    this.height,
    this.wordSpacing = 0,
    this.fontSize,
    this.textType = FxTextType.b1,
    this.textAlign,
    this.maxLines,
    this.locale,
    this.overflow,
    this.semanticsLabel,
    this.softWrap,
    this.strutStyle,
    this.textDirection,
    this.textHeightBehavior,
    this.textScaleFactor,
    this.textWidthBasis,
  }) : super(key: key);

  const FxText.h4(
    this.text, {
    Key? key,
    this.style,
    this.fontWeight = 500,
    this.muted = false,
    this.xMuted = false,
    this.letterSpacing,
    this.color,
    this.decoration = TextDecoration.none,
    this.height,
    this.wordSpacing = 0,
    this.fontSize,
    this.textType = FxTextType.h4,
    this.textAlign,
    this.maxLines,
    this.locale,
    this.overflow,
    this.semanticsLabel,
    this.softWrap,
    this.strutStyle,
    this.textDirection,
    this.textHeightBehavior,
    this.textScaleFactor,
    this.textWidthBasis,
  }) : super(key: key);

  const FxText.h5(
    this.text, {
    Key? key,
    this.style,
    this.fontWeight = 500,
    this.muted = false,
    this.xMuted = false,
    this.letterSpacing,
    this.color,
    this.decoration = TextDecoration.none,
    this.height,
    this.wordSpacing = 0,
    this.fontSize,
    this.textType = FxTextType.h5,
    this.textAlign,
    this.maxLines,
    this.locale,
    this.overflow,
    this.semanticsLabel,
    this.softWrap,
    this.strutStyle,
    this.textDirection,
    this.textHeightBehavior,
    this.textScaleFactor,
    this.textWidthBasis,
  }) : super(key: key);

  const FxText.h6(
    this.text, {
    Key? key,
    this.style,
    this.fontWeight = 500,
    this.muted = false,
    this.xMuted = false,
    this.letterSpacing,
    this.color,
    this.decoration = TextDecoration.none,
    this.height,
    this.wordSpacing = 0,
    this.fontSize,
    this.textType = FxTextType.h6,
    this.textAlign,
    this.maxLines,
    this.locale,
    this.overflow,
    this.semanticsLabel,
    this.softWrap,
    this.strutStyle,
    this.textDirection,
    this.textHeightBehavior,
    this.textScaleFactor,
    this.textWidthBasis,
  }) : super(key: key);

  const FxText.sh1(
    this.text, {
    Key? key,
    this.style,
    this.fontWeight = 500,
    this.muted = false,
    this.xMuted = false,
    this.letterSpacing,
    this.color,
    this.decoration = TextDecoration.none,
    this.height,
    this.wordSpacing = 0,
    this.fontSize,
    this.textType = FxTextType.sh1,
    this.textAlign,
    this.maxLines,
    this.locale,
    this.overflow,
    this.semanticsLabel,
    this.softWrap,
    this.strutStyle,
    this.textDirection,
    this.textHeightBehavior,
    this.textScaleFactor,
    this.textWidthBasis,
  }) : super(key: key);

  const FxText.sh2(
    this.text, {
    Key? key,
    this.style,
    this.fontWeight = 500,
    this.muted = false,
    this.xMuted = false,
    this.letterSpacing,
    this.color,
    this.decoration = TextDecoration.none,
    this.height,
    this.wordSpacing = 0,
    this.fontSize,
    this.textType = FxTextType.sh2,
    this.textAlign,
    this.maxLines,
    this.locale,
    this.overflow,
    this.semanticsLabel,
    this.softWrap,
    this.strutStyle,
    this.textDirection,
    this.textHeightBehavior,
    this.textScaleFactor,
    this.textWidthBasis,
  }) : super(key: key);

  const FxText.button(
    this.text, {
    Key? key,
    this.style,
    this.fontWeight = 500,
    this.muted = false,
    this.xMuted = false,
    this.letterSpacing,
    this.color,
    this.decoration = TextDecoration.none,
    this.height,
    this.wordSpacing = 0,
    this.fontSize,
    this.textType = FxTextType.button,
    this.textAlign,
    this.maxLines,
    this.locale,
    this.overflow,
    this.semanticsLabel,
    this.softWrap,
    this.strutStyle,
    this.textDirection,
    this.textHeightBehavior,
    this.textScaleFactor,
    this.textWidthBasis,
  }) : super(key: key);

  const FxText.caption(
    this.text, {
    Key? key,
    this.style,
    this.fontWeight = 500,
    this.muted = false,
    this.xMuted = false,
    this.letterSpacing,
    this.color,
    this.decoration = TextDecoration.none,
    this.height,
    this.wordSpacing = 0,
    this.fontSize,
    this.textType = FxTextType.caption,
    this.textAlign,
    this.maxLines,
    this.locale,
    this.overflow,
    this.semanticsLabel,
    this.softWrap,
    this.strutStyle,
    this.textDirection,
    this.textHeightBehavior,
    this.textScaleFactor,
    this.textWidthBasis,
  }) : super(key: key);

  const FxText.overline(
    this.text, {
    Key? key,
    this.style,
    this.fontWeight = 500,
    this.muted = false,
    this.xMuted = false,
    this.letterSpacing,
    this.color,
    this.decoration = TextDecoration.none,
    this.height,
    this.wordSpacing = 0,
    this.fontSize,
    this.textType = FxTextType.overline,
    this.textAlign,
    this.maxLines,
    this.locale,
    this.overflow,
    this.semanticsLabel,
    this.softWrap,
    this.strutStyle,
    this.textDirection,
    this.textHeightBehavior,
    this.textScaleFactor,
    this.textWidthBasis,
  }) : super(key: key);

  // Material Design 3

  const FxText.d1(
    this.text, {
    Key? key,
    this.style,
    this.fontWeight,
    this.muted = false,
    this.xMuted = false,
    this.letterSpacing,
    this.color,
    this.decoration = TextDecoration.none,
    this.height,
    this.wordSpacing = 0,
    this.fontSize,
    this.textType = FxTextType.d1,
    this.textAlign,
    this.maxLines,
    this.locale,
    this.overflow,
    this.semanticsLabel,
    this.softWrap,
    this.strutStyle,
    this.textDirection,
    this.textHeightBehavior,
    this.textScaleFactor,
    this.textWidthBasis,
  }) : super(key: key);

  const FxText.d2(
    this.text, {
    Key? key,
    this.style,
    this.fontWeight,
    this.muted = false,
    this.xMuted = false,
    this.letterSpacing,
    this.color,
    this.decoration = TextDecoration.none,
    this.height,
    this.wordSpacing = 0,
    this.fontSize,
    this.textType = FxTextType.d2,
    this.textAlign,
    this.maxLines,
    this.locale,
    this.overflow,
    this.semanticsLabel,
    this.softWrap,
    this.strutStyle,
    this.textDirection,
    this.textHeightBehavior,
    this.textScaleFactor,
    this.textWidthBasis,
  }) : super(key: key);

  const FxText.d3(
    this.text, {
    Key? key,
    this.style,
    this.fontWeight,
    this.muted = false,
    this.xMuted = false,
    this.letterSpacing,
    this.color,
    this.decoration = TextDecoration.none,
    this.height,
    this.wordSpacing = 0,
    this.fontSize,
    this.textType = FxTextType.d3,
    this.textAlign,
    this.maxLines,
    this.locale,
    this.overflow,
    this.semanticsLabel,
    this.softWrap,
    this.strutStyle,
    this.textDirection,
    this.textHeightBehavior,
    this.textScaleFactor,
    this.textWidthBasis,
  }) : super(key: key);

  const FxText.h1(
    this.text, {
    Key? key,
    this.style,
    this.fontWeight = 500,
    this.muted = false,
    this.xMuted = false,
    this.letterSpacing,
    this.color,
    this.decoration = TextDecoration.none,
    this.height,
    this.wordSpacing = 0,
    this.fontSize,
    this.textType = FxTextType.h1,
    this.textAlign,
    this.maxLines,
    this.locale,
    this.overflow,
    this.semanticsLabel,
    this.softWrap,
    this.strutStyle,
    this.textDirection,
    this.textHeightBehavior,
    this.textScaleFactor,
    this.textWidthBasis,
  }) : super(key: key);

  const FxText.h2(
    this.text, {
    Key? key,
    this.style,
    this.fontWeight = 500,
    this.muted = false,
    this.xMuted = false,
    this.letterSpacing,
    this.color,
    this.decoration = TextDecoration.none,
    this.height,
    this.wordSpacing = 0,
    this.fontSize,
    this.textType = FxTextType.h2,
    this.textAlign,
    this.maxLines,
    this.locale,
    this.overflow,
    this.semanticsLabel,
    this.softWrap,
    this.strutStyle,
    this.textDirection,
    this.textHeightBehavior,
    this.textScaleFactor,
    this.textWidthBasis,
  }) : super(key: key);

  const FxText.h3(
    this.text, {
    Key? key,
    this.style,
    this.fontWeight = 500,
    this.muted = false,
    this.xMuted = false,
    this.letterSpacing,
    this.color,
    this.decoration = TextDecoration.none,
    this.height,
    this.wordSpacing = 0,
    this.fontSize,
    this.textType = FxTextType.h3,
    this.textAlign,
    this.maxLines,
    this.locale,
    this.overflow,
    this.semanticsLabel,
    this.softWrap,
    this.strutStyle,
    this.textDirection,
    this.textHeightBehavior,
    this.textScaleFactor,
    this.textWidthBasis,
  }) : super(key: key);

  const FxText.t1(
    this.text, {
    Key? key,
    this.style,
    this.fontWeight,
    this.muted = false,
    this.xMuted = false,
    this.letterSpacing,
    this.color,
    this.decoration = TextDecoration.none,
    this.height,
    this.wordSpacing = 0,
    this.fontSize,
    this.textType = FxTextType.t1,
    this.textAlign,
    this.maxLines,
    this.locale,
    this.overflow,
    this.semanticsLabel,
    this.softWrap,
    this.strutStyle,
    this.textDirection,
    this.textHeightBehavior,
    this.textScaleFactor,
    this.textWidthBasis,
  }) : super(key: key);

  const FxText.t2(
    this.text, {
    Key? key,
    this.style,
    this.fontWeight,
    this.muted = false,
    this.xMuted = false,
    this.letterSpacing,
    this.color,
    this.decoration = TextDecoration.none,
    this.height,
    this.wordSpacing = 0,
    this.fontSize,
    this.textType = FxTextType.t2,
    this.textAlign,
    this.maxLines,
    this.locale,
    this.overflow,
    this.semanticsLabel,
    this.softWrap,
    this.strutStyle,
    this.textDirection,
    this.textHeightBehavior,
    this.textScaleFactor,
    this.textWidthBasis,
  }) : super(key: key);

  const FxText.t3(
    this.text, {
    Key? key,
    this.style,
    this.fontWeight,
    this.muted = false,
    this.xMuted = false,
    this.letterSpacing,
    this.color,
    this.decoration = TextDecoration.none,
    this.height,
    this.wordSpacing = 0,
    this.fontSize,
    this.textType = FxTextType.t3,
    this.textAlign,
    this.maxLines,
    this.locale,
    this.overflow,
    this.semanticsLabel,
    this.softWrap,
    this.strutStyle,
    this.textDirection,
    this.textHeightBehavior,
    this.textScaleFactor,
    this.textWidthBasis,
  }) : super(key: key);

  const FxText.l1(
    this.text, {
    Key? key,
    this.style,
    this.fontWeight,
    this.muted = false,
    this.xMuted = false,
    this.letterSpacing,
    this.color,
    this.decoration = TextDecoration.none,
    this.height,
    this.wordSpacing = 0,
    this.fontSize,
    this.textType = FxTextType.l1,
    this.textAlign,
    this.maxLines,
    this.locale,
    this.overflow,
    this.semanticsLabel,
    this.softWrap,
    this.strutStyle,
    this.textDirection,
    this.textHeightBehavior,
    this.textScaleFactor,
    this.textWidthBasis,
  }) : super(key: key);

  const FxText.l2(
    this.text, {
    Key? key,
    this.style,
    this.fontWeight,
    this.muted = false,
    this.xMuted = false,
    this.letterSpacing,
    this.color,
    this.decoration = TextDecoration.none,
    this.height,
    this.wordSpacing = 0,
    this.fontSize,
    this.textType = FxTextType.l2,
    this.textAlign,
    this.maxLines,
    this.locale,
    this.overflow,
    this.semanticsLabel,
    this.softWrap,
    this.strutStyle,
    this.textDirection,
    this.textHeightBehavior,
    this.textScaleFactor,
    this.textWidthBasis,
  }) : super(key: key);

  const FxText.l3(
    this.text, {
    Key? key,
    this.style,
    this.fontWeight,
    this.muted = false,
    this.xMuted = false,
    this.letterSpacing,
    this.color,
    this.decoration = TextDecoration.none,
    this.height,
    this.wordSpacing = 0,
    this.fontSize,
    this.textType = FxTextType.l3,
    this.textAlign,
    this.maxLines,
    this.locale,
    this.overflow,
    this.semanticsLabel,
    this.softWrap,
    this.strutStyle,
    this.textDirection,
    this.textHeightBehavior,
    this.textScaleFactor,
    this.textWidthBasis,
  }) : super(key: key);

  const FxText.b1(
    this.text, {
    Key? key,
    this.style,
    this.fontWeight,
    this.muted = false,
    this.xMuted = false,
    this.letterSpacing,
    this.color,
    this.decoration = TextDecoration.none,
    this.height,
    this.wordSpacing = 0,
    this.fontSize,
    this.textType = FxTextType.b1,
    this.textAlign,
    this.maxLines,
    this.locale,
    this.overflow,
    this.semanticsLabel,
    this.softWrap,
    this.strutStyle,
    this.textDirection,
    this.textHeightBehavior,
    this.textScaleFactor,
    this.textWidthBasis,
  }) : super(key: key);

  const FxText.b2(
    this.text, {
    Key? key,
    this.style,
    this.fontWeight,
    this.muted = false,
    this.xMuted = false,
    this.letterSpacing,
    this.color,
    this.decoration = TextDecoration.none,
    this.height,
    this.wordSpacing = 0,
    this.fontSize,
    this.textType = FxTextType.b2,
    this.textAlign,
    this.maxLines,
    this.locale,
    this.overflow,
    this.semanticsLabel,
    this.softWrap,
    this.strutStyle,
    this.textDirection,
    this.textHeightBehavior,
    this.textScaleFactor,
    this.textWidthBasis,
  }) : super(key: key);

  const FxText.b3(
    this.text, {
    Key? key,
    this.style,
    this.fontWeight,
    this.muted = false,
    this.xMuted = false,
    this.letterSpacing,
    this.color,
    this.decoration = TextDecoration.none,
    this.height,
    this.wordSpacing = 0,
    this.fontSize,
    this.textType = FxTextType.b3,
    this.textAlign,
    this.maxLines,
    this.locale,
    this.overflow,
    this.semanticsLabel,
    this.softWrap,
    this.strutStyle,
    this.textDirection,
    this.textHeightBehavior,
    this.textScaleFactor,
    this.textWidthBasis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ??
          FxTextStyle.getStyle(
            textStyle: style,
            color: color,
            fontWeight: fontWeight ??
                FxTextStyle.defaultTextFontWeight[textType] ??
                500,
            muted: muted,
            letterSpacing: letterSpacing ??
                FxTextStyle.defaultLetterSpacing[textType] ??
                0.15,
            height: height,
            xMuted: xMuted,
            decoration: decoration,
            wordSpacing: wordSpacing,
            fontSize: fontSize ?? FxTextStyle.defaultTextSize[textType],
          ),
      textAlign: textAlign,
      maxLines: maxLines,
      locale: locale,
      overflow: overflow,
      semanticsLabel: semanticsLabel,
      softWrap: softWrap,
      strutStyle: strutStyle,
      textDirection: textDirection ?? FxAppTheme.textDirection,
      textHeightBehavior: textHeightBehavior,
      textScaleFactor: textScaleFactor,
      textWidthBasis: textWidthBasis,
      key: key,
    );
  }
}
