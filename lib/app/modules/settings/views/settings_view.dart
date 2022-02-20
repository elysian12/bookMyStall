import 'package:bookmystall/app/common/styles/colors.dart';
import 'package:bookmystall/app/common/styles/text_style.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/settings_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsView extends GetView<SettingsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          backgroundColor: AppColors.backgroundColor,
          elevation: 0,
          automaticallyImplyLeading: false,
          // iconTheme: ,
          leadingWidth: 50,

          leading: InkWell(
            // onTap: () => Get.back(),
            child: Container(
              height: 36.r,
              width: 36.r,
              margin: EdgeInsets.only(left: 10.w),
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: AppColors.whiteColor),
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.black,
                size: 20.r,
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Column(
              children: [
                SizedBox(
                  height: 40.h,
                ),
                CircleAvatar(
                  radius: 44.r,
                  backgroundColor: AppColors.whiteColor,
                  child: Icon(
                    Icons.person,
                    color: Colors.black,
                    size: 34.r,
                  ),
                ),
                SizedBox(
                  height: 35.h,
                ),
                Divider(
                  thickness: 1,
                  color: AppColors.fontColor,
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  'Change City',
                  style: MyTextstyles.mediumTextStyle.copyWith(
                    fontSize: Get.width / 23,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Divider(
                  thickness: 1,
                  color: AppColors.fontColor,
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  'Saved Envents',
                  style: MyTextstyles.mediumTextStyle.copyWith(
                    fontSize: Get.width / 23,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Divider(
                  thickness: 1,
                  color: AppColors.fontColor,
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  'Feed back',
                  style: MyTextstyles.mediumTextStyle.copyWith(
                    fontSize: Get.width / 23,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(
                  height: 200.h,
                ),
                Text(
                  'Developed by',
                  style: MyTextstyles.smallTextStyle.copyWith(
                    fontWeight: FontWeight.w300,
                    color: Color(0xff9C9C9C),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  'BookMyStall',
                  style: MyTextstyles.cardTextStyle.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: Get.width / 10,
                    color: Color(0xff9C9C9C),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'Chalo India Kholo Dukaan',
                  style: MyTextstyles.smallTextStyle.copyWith(
                    fontWeight: FontWeight.w300,
                    color: Color(0xff9C9C9C),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
