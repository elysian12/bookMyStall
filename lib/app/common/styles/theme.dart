import 'package:bookmystall/app/common/styles/colors.dart';
import 'package:bookmystall/app/common/styles/text_style.dart';
import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
    primaryColor: AppColors.backgroundColor,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    textTheme: textTheme(),
    fontFamily: 'Roboto',
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

TextTheme textTheme() {
  return TextTheme(
    bodyText1: MyTextstyles.cardTextStyle,
    bodyText2: MyTextstyles.smallTextStyle,
  );
}
