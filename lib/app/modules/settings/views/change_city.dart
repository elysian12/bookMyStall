import 'package:bookmystall/app/common/styles/colors.dart';
import 'package:bookmystall/app/common/styles/text_style.dart';
import 'package:bookmystall/app/modules/settings/controllers/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ChangeCityView extends GetView<SettingsController> {
  const ChangeCityView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  children: List.generate(controller.cities.length, (index) {
                    return InkWell(
                      onTap: () {
                        controller.showCity(index);
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 15.h),
                        child: Text(
                          controller.cities[index].label,
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
                  controller.setDefault();
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
