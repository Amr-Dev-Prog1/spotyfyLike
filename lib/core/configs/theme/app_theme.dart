import 'package:flutter/material.dart';
import 'package:spotify_like/core/configs/theme/app_Color.dart';

class AppTheme {
  static final light = ThemeData(
    brightness: Brightness.light,
    fontFamily: "Satoshi",
    primaryColor: Color(0xff42C83C),
    scaffoldBackgroundColor: Color(0xffF2F2F2),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.primary,
        foregroundColor: Colors.white,
        textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
    ),

    colorScheme: ColorScheme.light(
      primary: Color(0xff42C83C),
      secondary: Color(0xffBEBEBE),
    ),
  );

  static final dark = ThemeData(
    brightness: Brightness.dark,
    fontFamily: "Satoshi",
    primaryColor: Color(0xff42C83C),
    scaffoldBackgroundColor: Color(0xff0D0C0C),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.primary,
        foregroundColor: Colors.white,
        textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
    ),

    colorScheme: ColorScheme.dark(
      primary: Color(0xff42C83C),
      secondary: Color(0xffBEBEBE),
    ),
  );
}
