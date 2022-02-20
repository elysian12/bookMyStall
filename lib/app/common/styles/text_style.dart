import 'package:bookmystall/app/common/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class MyTextstyles {
  static TextStyle get cardTextStyle => TextStyle(
        color: AppColors.fontColor,
        fontSize: 22.sp,
        fontWeight: FontWeight.bold,
        fontFamily: 'Roboto',
      );
  static TextStyle get smallTextStyle => TextStyle(
        color: AppColors.fontColor,
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        fontFamily: 'Roboto',
      );
  static TextStyle get mediumTextStyle => TextStyle(
        color: AppColors.fontColor,
        fontSize: 15.sp,
        fontWeight: FontWeight.w600,
        fontFamily: 'Roboto',
      );
}
