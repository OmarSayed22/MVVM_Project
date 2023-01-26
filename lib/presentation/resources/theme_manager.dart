import 'package:flutter/material.dart';
import 'package:flutter_advanced/presentation/resources/resources.dart';

ThemeData getAppTheme() =>
    ThemeData(
      // useMaterial3: true,

        primaryColorDark: ColorsManager.darkGrayColor,
        primaryColorLight: ColorsManager.primaryColorLight,
        disabledColor: ColorsManager.disabledColor,
        splashColor: ColorsManager.primaryColorLight,
        errorColor: ColorsManager.errorColor,
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
            disabledBackgroundColor: ColorsManager.disabledColor,
            textStyle: getRegularStyle(
                color: ColorsManager.whiteColor, fontSize: FontSize.s17),
            backgroundColor: ColorsManager.primaryColor,
            shadowColor: ColorsManager.primaryColorLight,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.size12),
            ),
          ),
        ),
        //Tex
        textTheme: TextTheme(
          displayLarge: getSemiBoldStyle(
              color: ColorsManager.darkGrayColor, fontSize: FontSize.s16),
          displayMedium: getRegularStyle(
              color: ColorsManager.darkGrayColor, fontSize: FontSize.s14),
          displaySmall: getRegularStyle(
              color: ColorsManager.blackColor, fontSize: FontSize.s14),
          headlineMedium: getMediumStyle(
              color: ColorsManager.primaryColor, fontSize: FontSize.s16),
          headlineSmall: getRegularStyle(
              color: ColorsManager.primaryColor, fontSize: FontSize.s12),
          bodyMedium: getMediumStyle(
              color: ColorsManager.darkGrayColor, fontSize: FontSize.s14),
          bodySmall: getMediumStyle(
              color: ColorsManager.primaryColor, fontSize: FontSize.s12),
          labelLarge: getRegularStyle(
              color: ColorsManager.whiteColor, fontSize: FontSize.s17),
        ),
        //TextFormFieldTheme
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              shadowColor: ColorsManager.primaryColorLight,
            )),
        inputDecorationTheme: InputDecorationTheme(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSize.size12),
              borderSide: BorderSide(
                  width: AppSize.size1, color: ColorsManager.borderColor),
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
