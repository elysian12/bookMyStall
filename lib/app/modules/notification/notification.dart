import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../common/styles/colors.dart';
import '../../common/styles/text_style.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80.h,
        backgroundColor: AppColors.appBarColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        // iconTheme: ,
        leadingWidth: 50,
        leading: InkWell(
          onTap: () => Get.back(),
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
        title: Text(
          ' BMS Notifications',
          style: MyTextstyles.cardTextStyle.copyWith(
            color: Color(0xff50575B),
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text('No Notifications'),
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
            SizedBox(
              height: 50.h,
            ),
          ],
        ),
      ),
    );
  }
}
