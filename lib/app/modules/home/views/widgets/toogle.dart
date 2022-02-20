import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/styles/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterToggle extends StatelessWidget {
  const FilterToggle({
    Key? key,
    this.onTap,
    required this.name,
    required this.isSelected,
  }) : super(key: key);

  final String name;
  final void Function()? onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Get.width / 15),
          color: isSelected ? AppColors.whiteColor : AppColors.backgroundColor,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10.w,
            vertical: 10.h,
          ),
          child: Text(
            name,
          ),
        ),
      ),
    );
  }
}
