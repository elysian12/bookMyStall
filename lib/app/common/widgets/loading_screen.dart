import 'package:bookmystall/app/common/styles/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      color: Color(0xffFFFFD9),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoActivityIndicator(
              radius: 14.r,
              color: Colors.black,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'Loading Events',
              style: MyTextstyles.mediumTextStyle,
            )
          ],
        ),
      ),
    );
  }
}
