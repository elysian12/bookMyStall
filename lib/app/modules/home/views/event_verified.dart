import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../common/styles/colors.dart';
import '../../../common/styles/text_style.dart';

class EventVerifiedView extends StatelessWidget {
  const EventVerifiedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 380.h,
              width: 325.w,
              margin: EdgeInsets.symmetric(horizontal: 30.w),
              decoration: BoxDecoration(
                color: AppColors.fontColor.withOpacity(0.3),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Text('Event Verification T&C'),
                  Divider(
                    thickness: 2,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    '- BookMyStall Officially will\nnot involve direct communication \n with any info provided by the \nOrganizer/Event Manager.\nUsers have to verify the info\n by themselves before using it.\n  BookMyStall not liable for any\nother proceedings.-For Queries please visit our website  ',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: AppColors.fontColor, height: 2.h),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  InkWell(
                    onTap: () {
                      launch('https://www.bookmystall.in/legal');
                    },
                    child: Text(
                      'www.bookmystall.in/legal',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: AppColors.fontColor),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 30.w),
                alignment: Alignment.center,
                width: double.infinity,
                height: 40.h,
                decoration: BoxDecoration(
                    border: Border.all(),
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(6)),
                child: Text(
                  'Close',
                  style: MyTextstyles.mediumTextStyle.copyWith(
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}
