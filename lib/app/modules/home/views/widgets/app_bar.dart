import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
      SvgPicture.asset('${Helper.homeIcon}add.svg'),
      SizedBox(
        width: 20.w,
      ),
      SvgPicture.asset('${Helper.homeIcon}notification.svg'),
      SizedBox(
        width: 15.w,
      ),
    ],
  );
}
