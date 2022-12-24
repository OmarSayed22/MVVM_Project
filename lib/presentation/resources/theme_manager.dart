import 'package:flutter/material.dart';
import 'package:flutter_advanced/presentation/resources/resources.dart';

ThemeData getAppTheme() => ThemeData(
    //main colors
  brightness: Brightness.dark,
    primaryColor: ColorsManager.primaryColor,
    primaryColorDark: ColorsManager.darkGrayColor,
    primaryColorLight: ColorsManager.primaryColorLight,
    disabledColor: ColorsManager.disabledColor,
    errorColor: ColorsManager.errorColor,
    splashColor: ColorsManager.primaryColorLight,
    //card theme
    cardTheme: CardTheme(
        color: ColorsManager.whiteColor,
        shadowColor: ColorsManager.grayColor1,
        elevation: AppMargin.m4,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.size16))),
    //AppBarTheme
    appBarTheme: AppBarTheme(
      shadowColor: ColorsManager.primaryColorLight,
      titleTextStyle: getRegularStyle(
          color: ColorsManager.whiteColor, fontSize: FontSize.s16),
      color: ColorsManager.primaryColor,
      centerTitle: true,
      elevation: AppSize.size4,
    ),
    //ButtonTheme
    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      buttonColor: ColorsManager.primaryColor,
      splashColor: ColorsManager.primaryColorLight,
    ),
    //Elevated Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(

        textStyle: getRegularStyle(
            color: ColorsManager.whiteColor, fontSize: FontSize.s17),
        backgroundColor: ColorsManager.primaryColor,
        shadowColor: ColorsManager.primaryColorLight,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.size12),
        ),
      ),
    ),
    //TextTheme
    textTheme: TextTheme(
      headline1: getSemiBoldStyle(
          color: ColorsManager.darkGrayColor, fontSize: FontSize.s16),
      headline2: getRegularStyle(
          color: ColorsManager.darkGrayColor, fontSize: FontSize.s14),
      headline3: getSemiBoldStyle(
          color: ColorsManager.primaryColor, fontSize: FontSize.s18),
      bodyText2: getMediumStyle(
          color: ColorsManager.darkGrayColor, fontSize: FontSize.s14),
      headline4: getMediumStyle(
          color: ColorsManager.primaryColor, fontSize: FontSize.s16),
      caption: getMediumStyle(
          color: ColorsManager.primaryColor, fontSize: FontSize.s12),
    ),
    //TextFormFieldTheme
    inputDecorationTheme: InputDecorationTheme(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.size12),
          borderSide: BorderSide(
              width: AppSize.size1, color: ColorsManager.primaryColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.size12),
          borderSide: BorderSide(
              width: AppSize.size1, color: ColorsManager.borderColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.size12),
          borderSide:
              BorderSide(width: AppSize.size1, color: ColorsManager.errorColor),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.size12),
          borderSide: BorderSide(
              width: AppSize.size1, color: ColorsManager.primaryColor),
        ),
        contentPadding: const EdgeInsets.all(AppPadding.p8),
        hintStyle: getRegularStyle(
            color: ColorsManager.grayColor2, fontSize: FontSize.s14)));
