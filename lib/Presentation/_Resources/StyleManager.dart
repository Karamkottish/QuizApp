import 'package:english_quiz/Presentation/_Resources/ColorManager.dart';
import 'package:english_quiz/Presentation/_Resources/FontManager.dart';
import 'package:flutter/material.dart';

mixin TextStyleManager{

  static TextStyle _getTextStyle(double size, FontWeight weight, Color color,
      {String family = FontManager.fontFamily}) => TextStyle(
      fontSize: size,fontWeight: weight,color: color,fontFamily: family);


  static TextStyle getRegularStyle({double size = FontSizeManager.s15,
    Color color = ColorManager.primary}) =>
      _getTextStyle(size, FontWeightManager.regularW, color);

  static TextStyle getMediumStyle({double size = FontSizeManager.s20,
    Color color = ColorManager.primary}) =>
      _getTextStyle(size, FontWeightManager.mediumW, color);
}