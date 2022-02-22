import 'package:bookmystall/app/modules/bottomnavigation/controllers/bottomnavigation_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../styles/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyBottomBar extends GetView<BottomNavigationController> {
  const MyBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // showCupertinoModalPopup(context: context, builder: ())
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: AppColors.whiteColor,
      ),
      child: SizedBox(
        height: Get.height * 0.09,
        child: Obx(
          () => BottomNavigationBar(
            iconSize: 26,
            currentIndex: controller.tabIndex.value,
            onTap: controller.changePage,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.black,
            items: [
              BottomNavigationBarItem(
                icon: controller.tabIndex.value == 0
                    ? Column(
                        children: [
                          Container(
                            // alignment: Alignment.center,
                            height: 37.r,
                            width: 37.r,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffF5F5F5)),
                            child: Icon(Icons.home_filled),
                          ),
                          Container(
                            height: 4.h,
                            width: 25.w,
                            decoration: BoxDecoration(
                                color: AppColors.pinkColor,
                                borderRadius: BorderRadius.circular(4)),
                          ),
                        ],
                      )
                    : Icon(
                        Icons.home,
                        color: Colors.black,
                      ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: controller.tabIndex.value == 1
                    ? Column(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: 35.r,
                            width: 35.r,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffF5F5F5)),
                            child: Icon(Icons.favorite),
                          ),
                          Container(
                            height: 4.h,
                            width: 25.w,
                            decoration: BoxDecoration(
                                color: AppColors.pinkColor,
                                borderRadius: BorderRadius.circular(4)),
                          ),
                        ],
                      )
                    : Icon(
                        Icons.favorite_outline,
                        color: Colors.black,
                      ),
                label: 'Favourite',
              ),
              BottomNavigationBarItem(
                icon: controller.tabIndex.value == 2
                    ? Column(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: 37.r,
                            width: 37.r,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffF5F5F5)),
                            child: Icon(Icons.menu_outlined),
                          ),
                          Container(
                            height: 4.h,
                            width: 25.w,
                            decoration: BoxDecoration(
                              color: AppColors.pinkColor,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ],
                      )
                    : Icon(
                        Icons.menu,
                        color: Colors.black,
                      ),
                label: 'Settings',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
