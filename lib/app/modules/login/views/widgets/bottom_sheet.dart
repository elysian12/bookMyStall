import 'package:bookmystall/app/modules/login/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../common/styles/colors.dart';
import '../../../../common/styles/text_style.dart';
import 'otp_field.dart';

class OtpBottomSheet extends StatelessWidget {
  final TextEditingController textEditingController;
  const OtpBottomSheet({Key? key, required this.textEditingController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginController());
    return Container(
      height: 300.h,
      width: double.infinity,
      color: AppColors.whiteColor,
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.clear,
                color: AppColors.pinkColor,
              ),
            ),
          ),
          Obx(() {
            return Text(
              'Detecting OTP ${loginController.otpTimer.value} s',
              style: MyTextstyles.mediumTextStyle.copyWith(
                fontWeight: FontWeight.w500,
              ),
            );
          }),
          SizedBox(
            height: 20.h,
          ),
          Text(
            'We have sent a 6-digit OTP on',
            style: MyTextstyles.smallTextStyle.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            '+91 ' + textEditingController.text,
            style: MyTextstyles.smallTextStyle.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OtpTextField(
                    first: true,
                    last: false,
                    textEditingController: loginController.firstOTP),
                OtpTextField(
                    first: false,
                    last: false,
                    textEditingController: loginController.secondOTP),
                OtpTextField(
                    first: false,
                    last: false,
                    textEditingController: loginController.thirdOTP),
                OtpTextField(
                    first: false,
                    last: false,
                    textEditingController: loginController.fourOTP),
                OtpTextField(
                    first: false,
                    last: false,
                    textEditingController: loginController.fifthOTP),
                OtpTextField(
                  first: false,
                  last: true,
                  textEditingController: loginController.sixthOTP,
                  onFilledSubmitted: (value) {
                    loginController.verifyOtp();
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          TextButton(
            onPressed: loginController.otpTimer.value == 0
                ? () {
                    print('---resend-');
                    loginController.requestOtp(
                      int.parse(loginController.loginController.text),
                    );
                    // Get.toNamed(Routes.BOTTOMNAVIGATION);
                  }
                : null,
            child: Obx(() {
              return Text(
                'Resend OTP',
                style: loginController.otpTimer.value == 0
                    ? MyTextstyles.mediumTextStyle.copyWith(
                        color: AppColors.appBarColor,
                      )
                    : MyTextstyles.mediumTextStyle.copyWith(
                        // color: AppColors.pinkColor,x
                        ),
              );
            }),
          )
        ],
      ),
    );
  }
}
