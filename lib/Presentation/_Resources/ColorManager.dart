
import 'package:flutter/material.dart';

mixin ColorManager{


  static const Color primary= Color(0xFF884195);
  static const Color onPrimary= Color(0xFFFFFFFF);
  static const Color primaryContainer = Color(0xFFF6ECF7);
  static const Color surface= Color(0xFFFFF3FF);
  static const Color onSurface= Color(0xFF001E2F);
  static const Color errorContainer= Color(0xFFFFDAD6);
  static const Color onErrorContainer= Color(0xFF410002);
  static const Color tertiary= Color(0xFFD5F1D0);






















  // unused colors
  static const Color onSurfaceVariant= Color(0xFF41484D);
  static const Color secondary= Color(0xFF71787E);
  static const Color background= Color(0xFFD8E7EF);
  static const Color onBackground= Color(0xFF001E2F);
  static const Color onPrimaryContainer = Color(0xFF001E2E);
  static const Color onSecondary= Color(0xFFFFFFFF);
  static const Color secondaryContainer= Color(0xFFE9DDFF);
  static const Color onSecondaryContainer= Color(0xFF22005D);
  static const Color onTertiary= Color(0xFFFFFFFF);
  static const Color tertiaryContainer= Color(0xFFFFD9E2);
  static const Color onTertiaryContainer= Color(0xFF3F001C);
  static const Color error= Color(0xFFBA1A1A);
  static const Color onError= Color(0xFFFFFFFF);
  static const Color surfaceVariant= Color(0xFFDDE3EA);
  static const Color outline= Color(0xFF71787E);
  static const Color shadow= Color(0xFF000000);
  static const Color inverseSurface= Color(0xFF00344D);
  static const Color onInverseSurface= Color(0xFFE5F2FF);
  static const Color inversePrimary= Color(0xFF87CEFF);
  static const Color surfaceTint= Color(0xFF006590);






  static const ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: primary,
    onPrimary: onPrimary,
    primaryContainer: primaryContainer,
    secondary: secondary,
    surface: surface,
    onSurface: onSurface,
    onSurfaceVariant: onSurfaceVariant,
    //unused colors
    onPrimaryContainer: onPrimaryContainer,
    onSecondary: onSecondary,
    secondaryContainer: secondaryContainer,
    onSecondaryContainer: onSecondaryContainer,
    tertiary: tertiary,
    onTertiary: onTertiary,
    tertiaryContainer: tertiaryContainer,
    onTertiaryContainer: onTertiaryContainer,
    error: error,
    onError: onError,
    errorContainer: errorContainer,
    onErrorContainer: onErrorContainer,
    background: background,
    onBackground: onBackground,
    surfaceVariant: surfaceVariant,
    outline: outline,
    shadow: shadow,
    inverseSurface: inverseSurface,
    onInverseSurface: onInverseSurface,
    inversePrimary: inversePrimary,
    surfaceTint: surfaceTint,
  );

}