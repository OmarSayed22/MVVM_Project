
import 'package:flutter/material.dart';
import 'package:flutter_advanced/presentation/resources/resources.dart';

TextStyle getTextStyle({double? fontSize, FontWeight? fontWeight, Color? color}) {
  return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontFamily: FontConstants.fontFamily,
      color: color);
}

//Light Style
TextStyle getLightStyle({double fontSize = FontSize.s12, Color? color}) =>
    getTextStyle(
        fontSize: fontSize, fontWeight: FontWeightManager.light, color: color);
//Regular Style
TextStyle getRegularStyle({double fontSize = FontSize.s12, required Color color}) {
  return getTextStyle(
      fontSize: fontSize, fontWeight: FontWeightManager.regular, color: color);
}

//Medium Style
TextStyle? getMediumStyle({double fontSize = FontSize.s12, Color? color}) =>
    getTextStyle(
        fontSize: fontSize, fontWeight: FontWeightManager.medium, color: color);
//SemiBold Style
TextStyle getSemiBoldStyle({double fontSize = FontSize.s12, Color? color}) =>
    getTextStyle(
        fontSize: fontSize,
        fontWeight: FontWeightManager.semiBold,
        color: color);
//Bold Style
TextStyle getBoldStyle({double fontSize = FontSize.s12, Color? color}) =>
    getTextStyle(
        fontSize: fontSize, fontWeight: FontWeightManager.bold, color: color);
