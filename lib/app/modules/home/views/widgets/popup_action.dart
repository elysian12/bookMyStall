import 'package:bookmystall/app/common/styles/colors.dart';
import 'package:bookmystall/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../common/styles/text_style.dart';

class PopUpAction extends StatelessWidget {
  const PopUpAction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());
    print('PopAction');
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 29, 29, 29),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  'Select Your city',
                  style: MyTextstyles.cardTextStyle.copyWith(
                    fontWeight: FontWeight.normal,
                    fontSize: 17.sp,
                    color: Color.fromARGB(255, 202, 199, 199),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                // height: 400.h,
                width: 180.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.backgroundColor,
                ),
                child: Column(
                  children:
                      List.generate(homeController.cities.length, (index) {
                    return InkWell(
                      onTap: () {
                        homeController.showCity(index);
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 15.h),
                        child: Text(
                          homeController.cities[index].label,
                          style: MyTextstyles.cardTextStyle.copyWith(
                            fontWeight: FontWeight.normal,
                            fontSize: 17.sp,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              InkWell(
                onTap: () {
                  homeController.showCity(3);
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 40.h,
                  width: 180.w,
                  child: Text(
                    'Cancle',
                    style: MyTextstyles.cardTextStyle.copyWith(
                      fontWeight: FontWeight.normal,
                      fontSize: 17.sp,
                      color: Colors.black,
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.backgroundColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
