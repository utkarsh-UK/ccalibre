import 'package:ccalibre/core/theme/colors.dart';
import 'package:flutter/material.dart';
import '../utils/extensions.dart';

/// Defines app theme including text themes.
class ApplicationTheme {
  static ThemeData getAppThemeData() => ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: backgroundColor,
        iconTheme: const IconThemeData(color: iconColor, opacity: 1.0),
        appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: primaryTextColor,
        ),
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 32.0.sp,
            fontWeight: FontWeight.w700,
            color: primaryTextColor,
            fontFamily: 'Roboto',
          ),
          headline2: TextStyle(
            fontSize: 28.0.sp,
            fontWeight: FontWeight.w700,
            color: primaryTextColor,
            fontFamily: 'Roboto',
          ),
          headline3: TextStyle(
            fontSize: 24.0.sp,
            fontWeight: FontWeight.w700,
            color: primaryTextColor,
            fontFamily: 'Roboto',
          ),
          headline4: TextStyle(
            fontSize: 20.0.sp,
            fontWeight: FontWeight.w600,
            color: primaryTextColor,
            fontFamily: 'Roboto',
          ),
          headline5: TextStyle(
            fontSize: 18.0.sp,
            fontWeight: FontWeight.w600,
            color: primaryTextColor,
            fontFamily: 'Roboto',
          ),
          headline6: TextStyle(
            fontSize: 16.0.sp,
            fontWeight: FontWeight.w500,
            color: primaryTextColor,
          ),
          subtitle1: TextStyle(
            fontSize: 14.0.sp,
            fontWeight: FontWeight.w400,
            color: bodyTextColor,
            fontFamily: 'Roboto',
          ),
          subtitle2: TextStyle(
            fontSize: 12.0.sp,
            fontWeight: FontWeight.w400,
            color: bodyTextColor,
            fontFamily: 'Roboto',
            height: 1.3,
          ),
          bodyText1: TextStyle(
            fontSize: 18.0.sp,
            fontWeight: FontWeight.w400,
            color: bodyTextColor,
            fontFamily: 'Roboto',
          ),
          bodyText2: TextStyle(
            fontSize: 16.0.sp,
            fontWeight: FontWeight.w400,
            color: bodyTextColor,
            fontFamily: 'Roboto',
          ),
          button: TextStyle(
            fontSize: 16.0.sp,
            fontWeight: FontWeight.w600,
            color: primaryTextColor,
            fontFamily: 'Roboto',
          ),
        ),
      );
}
