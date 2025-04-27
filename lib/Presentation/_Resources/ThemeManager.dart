import 'package:english_quiz/Presentation/_Resources/ColorManager.dart';
import 'package:english_quiz/Presentation/_Resources/FontManager.dart';
import 'package:english_quiz/Presentation/_Resources/WidgetValueManager.dart';
import 'package:flutter/material.dart';

import 'StyleManager.dart';

mixin ThemeManager{



  static ThemeData lightThemeData = ThemeData(
    colorScheme: ColorManager.lightColorScheme,
    fontFamily: FontManager.fontFamily,
    appBarTheme: _appBarTheme,
    elevatedButtonTheme: _elevatedButtonTheme,
    textTheme: _textTheme,
    inputDecorationTheme: _textFormFieldTheme,radioTheme: _radioThemeData);

  static final AppBarTheme _appBarTheme = AppBarTheme(
    color: ColorManager.primary,
    titleTextStyle: TextStyleManager.getMediumStyle(
        size: FontSizeManager.s25,color: ColorManager.surface),
    shadowColor: Colors.transparent,
  );

  static final ElevatedButtonThemeData _elevatedButtonTheme =
  ElevatedButtonThemeData(style: ElevatedButton.styleFrom(
    minimumSize: const Size(AppSizeManager.s140, AppSizeManager.s50),
    padding: const EdgeInsets.symmetric(vertical: AppPaddingManager.p11,horizontal: AppPaddingManager.p25),
    elevation: AppSizeManager.s4,
    shape: RoundedRectangleBorder(borderRadius:
    BorderRadius.circular(AppSizeManager.s16)),
      textStyle: TextStyleManager.getRegularStyle(size: FontSizeManager.s25),
  ));

  static final TextTheme _textTheme = TextTheme(
    bodySmall: TextStyleManager.getRegularStyle(size: FontSizeManager.s13),
    bodyMedium: TextStyleManager.getRegularStyle(size: FontSizeManager.s15),
    displayMedium: TextStyleManager.getMediumStyle(size: FontSizeManager.s15),
    bodyLarge: TextStyleManager.getRegularStyle(size: FontSizeManager.s20),
    displayLarge: TextStyleManager.getMediumStyle(size: FontSizeManager.s20),
  );

  static final InputDecorationTheme _textFormFieldTheme =
  InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSizeManager.s16)
    ),
    contentPadding: const EdgeInsets.all(AppPaddingManager.p8),
    fillColor: Colors.transparent,
    labelStyle: TextStyleManager.getRegularStyle(size: FontSizeManager.s15),
    errorStyle: TextStyleManager.getMediumStyle(
        size: FontSizeManager.s15,color: ColorManager.error),
    enabledBorder: _getInputFormBorder(color: ColorManager.onSurfaceVariant),
    focusedBorder: _getInputFormBorder(color: ColorManager.primary),
    errorBorder: _getInputFormBorder(color: ColorManager.errorContainer),
    focusedErrorBorder: _getInputFormBorder(color: ColorManager.error)
  );

  // text form field
  static OutlineInputBorder _getInputFormBorder({double radius =
      AppSizeManager.s16, required Color color}) =>
      OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(color: color,width: 2)
      );



  static const RadioThemeData _radioThemeData = RadioThemeData();


}