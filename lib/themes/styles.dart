import 'package:flutter/material.dart';

abstract class Styles {
  static const lightScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xff156b54),
    surfaceTint: Color(0xff156b54),
    onPrimary: Color(0xffffffff),
    primaryContainer: Color(0xffa4f2d6),
    onPrimaryContainer: Color(0xff00513e),
    secondary: Color(0xff7d4e7d),
    onSecondary: Color(0xffffffff),
    secondaryContainer: Color(0xffffd6fa),
    onSecondaryContainer: Color(0xff633664),
    tertiary: Color(0xff854b70),
    onTertiary: Color(0xffffffff),
    tertiaryContainer: Color(0xffffd8ec),
    onTertiaryContainer: Color(0xff6a3457),
    error: Color(0xffba1a1a),
    onError: Color(0xffffffff),
    errorContainer: Color(0xffffdad6),
    onErrorContainer: Color(0xff93000a),
    surface: Color(0xfff5fbf6),
    onSurface: Color(0xff171d1a),
    onSurfaceVariant: Color(0xff3f4945),
    outline: Color(0xff707974),
    outlineVariant: Color(0xffbfc9c3),
    shadow: Color(0xff000000),
    scrim: Color(0xff000000),
    inverseSurface: Color(0xff2c322f),
    inversePrimary: Color(0xff88d6ba),
    primaryFixed: Color(0xffa4f2d6),
    onPrimaryFixed: Color(0xff002117),
    primaryFixedDim: Color(0xff88d6ba),
    onPrimaryFixedVariant: Color(0xff00513e),
    secondaryFixed: Color(0xffffd6fa),
    onSecondaryFixed: Color(0xff320936),
    secondaryFixedDim: Color(0xffedb4ea),
    onSecondaryFixedVariant: Color(0xff633664),
    tertiaryFixed: Color(0xffffd8ec),
    onTertiaryFixed: Color(0xff37072a),
    tertiaryFixedDim: Color(0xfff9b1db),
    onTertiaryFixedVariant: Color(0xff6a3457),
    surfaceDim: Color(0xffd5dbd7),
    surfaceBright: Color(0xfff5fbf6),
    surfaceContainerLowest: Color(0xffffffff),
    surfaceContainerLow: Color(0xffeff5f0),
    surfaceContainer: Color(0xffe9efeb),
    surfaceContainerHigh: Color(0xffe4eae5),
    surfaceContainerHighest: Color(0xffdee4df),
  );

  static const darkScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xff88d6ba),
    surfaceTint: Color(0xff88d6ba),
    onPrimary: Color(0xff00382a),
    primaryContainer: Color(0xff00513e),
    onPrimaryContainer: Color(0xffa4f2d6),
    secondary: Color(0xffedb4ea),
    onSecondary: Color(0xff4a204c),
    secondaryContainer: Color(0xff633664),
    onSecondaryContainer: Color(0xffffd6fa),
    tertiary: Color(0xfff9b1db),
    onTertiary: Color(0xff501e40),
    tertiaryContainer: Color(0xff6a3457),
    onTertiaryContainer: Color(0xffffd8ec),
    error: Color(0xffffb4ab),
    onError: Color(0xff690005),
    errorContainer: Color(0xff93000a),
    onErrorContainer: Color(0xffffdad6),
    surface: Color(0xff0f1512),
    onSurface: Color(0xffdee4df),
    onSurfaceVariant: Color(0xffbfc9c3),
    outline: Color(0xff89938e),
    outlineVariant: Color(0xff3f4945),
    shadow: Color(0xff000000),
    scrim: Color(0xff000000),
    inverseSurface: Color(0xffdee4df),
    inversePrimary: Color(0xff156b54),
    primaryFixed: Color(0xffa4f2d6),
    onPrimaryFixed: Color(0xff002117),
    primaryFixedDim: Color(0xff88d6ba),
    onPrimaryFixedVariant: Color(0xff00513e),
    secondaryFixed: Color(0xffffd6fa),
    onSecondaryFixed: Color(0xff320936),
    secondaryFixedDim: Color(0xffedb4ea),
    onSecondaryFixedVariant: Color(0xff633664),
    tertiaryFixed: Color(0xffffd8ec),
    onTertiaryFixed: Color(0xff37072a),
    tertiaryFixedDim: Color(0xfff9b1db),
    onTertiaryFixedVariant: Color(0xff6a3457),
    surfaceDim: Color(0xff0f1512),
    surfaceBright: Color(0xff343b38),
    surfaceContainerLowest: Color(0xff090f0d),
    surfaceContainerLow: Color(0xff171d1a),
    surfaceContainer: Color(0xff1b211e),
    surfaceContainerHigh: Color(0xff252b28),
    surfaceContainerHighest: Color(0xff303633),
  );

  static const TextStyle prodctRowItemName = TextStyle(
  
    fontSize: 18,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle prodctRowTotal = TextStyle(
  
    fontSize: 18,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle prodctRowItemPrice = TextStyle(
    color: Color(0XFF8E8E93),
    fontSize: 18,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle searchText = TextStyle(
  
    fontSize: 14,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle deliveryTimeLable = TextStyle(
    color: Color(0XFFC2C2C2),
    fontSize: 14,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w300,
  );
  static const TextStyle deliveryTime = TextStyle(
    color: Colors.grey,
  );
}
