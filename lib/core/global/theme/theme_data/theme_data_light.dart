import 'package:ecommerce_app/core/global/theme/app_colors/app_colors_light.dart';
import 'package:ecommerce_app/core/global/theme/app_fonts.dart';
import 'package:ecommerce_app/core/utils/app_sizes.dart';
import 'package:ecommerce_app/core/global/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData getThemeDataLight() => ThemeData(
      //color theme
      //  primaryColor: AppColorsLight.primaryColor,
      primarySwatch: AppColorsLight.primaryColor,

      scaffoldBackgroundColor: AppColorsLight.scaffoldColor,

      //appBar theme

      appBarTheme: AppBarTheme(
        elevation: AppElevation.e0,
        backgroundColor: AppColorsLight.primaryColor,
        titleTextStyle: getMediumStyle(
          color: AppColorsLight.white,
          fontsize: AppFontSize.s17,
        ),

        centerTitle: true,
        // ignore: prefer_const_constructors
        systemOverlayStyle: SystemUiOverlayStyle(),
      ),

      //textTheme
      textTheme: TextTheme(
        // headline2:
        //     getLightStyle(color: Colors.black, fontsize: AppFontSize.s14),
        // headline1: getExtraLightStyle(color: AppColorsLight.primaryColor),
        headline6:
            getMediumStyle(color: Colors.black, fontsize: AppFontSize.s14),
        // عنوان onboarding
        subtitle2: getBoldStyle(
          color: AppColorsLight.primaryColor,
          fontsize: AppFontSize.s24,
        ),

        // body onboarder
        bodyText1: getRegularStyle(
          color: Colors.black,
          fontsize: AppFontSize.s16,
        ),
//categories
        // subtitle1: getSemiBoldStyle(
        //   color: AppColorsLight.black,
        //   fontsize: AppFontSize.s16,
        // ),
      ),

      // TextButtonTheme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: getMediumStyle(
            color: AppColorsLight.primaryColor,
            fontsize: AppFontSize.s14,
          ),
        ),
      ),

      //elevatedBottun Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(346, 43),
          textStyle: getRegularStyle(
            color: AppColorsLight.white,
            fontsize: AppFontSize.s18,
          ),
          elevation: AppElevation.e0,
          backgroundColor: AppColorsLight.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppSize.s10,
            ),
          ),
        ),
      ),

      //Icon
      iconTheme: const IconThemeData(
        color: AppColorsLight.primaryColor,
      ),
    );
