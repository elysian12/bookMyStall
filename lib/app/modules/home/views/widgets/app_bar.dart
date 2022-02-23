import 'package:bookmystall/app/modules/addEvents/add_events.dart';
import 'package:bookmystall/app/modules/notification/notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../common/costants/helper.dart';
import '../../../../common/styles/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar MyAppBar() {
  return AppBar(
    // toolbarHeight: 12,
    backgroundColor: AppColors.appBarColor,
    elevation: 0,
    automaticallyImplyLeading: false,

    title: Text(
      'BookMyStall',
      style: TextStyle(
        color: Colors.black,
      ),
    ),
    actions: [
      InkWell(
        onTap: () {
          Get.to(() => AddEventView());
        },
        child: SvgPicture.asset('${Helper.homeIcon}add.svg'),
      ),
      SizedBox(
        width: 20.w,
      ),
      InkWell(
        onTap: () {
          Get.to(() => NotificationView());
        },
        child: SvgPicture.asset('${Helper.homeIcon}notification.svg'),
      ),
      SizedBox(
        width: 15.w,
      ),
    ],
  );
}
