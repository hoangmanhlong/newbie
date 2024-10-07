import 'package:flutter/material.dart';

class AppRes {

  static const appMainFontFamily = "Poppins";
  static const imageResPath = "assets/images";

  static  String getImageRes(String imageResName) => "$imageResPath/$imageResName";

  static ThemeData appThemeData = ThemeData(
      fontFamily: AppRes.appMainFontFamily,
  );
}