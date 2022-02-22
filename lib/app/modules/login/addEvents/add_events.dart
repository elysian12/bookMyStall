import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/styles/colors.dart';
import '../../../common/styles/text_style.dart';

class AddEventView extends StatelessWidget {
  const AddEventView({Key? key}) : super(key: key);

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
                  Text('Create New Event'),
                  Divider(
                    thickness: 2,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Please visit our website\n\nto create\n\nNew Event\n\n\n\nwww.bookmystall.in',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: AppColors.fontColor),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            InkWell(
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
