import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../common/styles/colors.dart';
import '../../common/styles/text_style.dart';

class ReportEventView extends StatelessWidget {
  const ReportEventView({Key? key}) : super(key: key);

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
                  Text('Report This Event'),
                  SizedBox(
                    height: 20.h,
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text('No response from Manager.'),
                  SizedBox(
                    height: 20.h,
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text('Event Cancelled'),
                  SizedBox(
                    height: 20.h,
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text('Event Postponed.'),
                  SizedBox(
                    height: 20.h,
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text('This Event is Fake.'),
                  SizedBox(
                    height: 10.h,
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
