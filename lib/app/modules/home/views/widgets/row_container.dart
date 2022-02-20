import 'package:bookmystall/app/modules/home/model/events_api_model.dart';
import 'package:flutter/material.dart';

import '../../../../common/styles/colors.dart';
import '../../../../common/styles/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StockRow extends StatelessWidget {
  const StockRow({
    Key? key,
    required this.stallDetails,
  }) : super(key: key);

  final StallDetails stallDetails;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              stallDetails.typeOfStall!,
              style: MyTextstyles.cardTextStyle.copyWith(
                fontSize: 20.sp,
              ),
            ),
            Text(
              '(${stallDetails.tables} tables, ${stallDetails.chairs} chairs )',
              style: MyTextstyles.smallTextStyle,
            ),
          ],
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.fontColor,
            ),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                height: 20.h,
                width: 100.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: AppColors.backgroundColor,
                ),
                child: Text(stallDetails.pricePerDay! + ' /-'),
              ),
              Container(
                alignment: Alignment.center,
                height: 20.h,
                width: 100.w,
                decoration: BoxDecoration(
                  color: AppColors.fontColor.withOpacity(0.5),
                ),
                child: Text('1 Day'),
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.fontColor,
            ),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                height: 20.h,
                width: 100.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: AppColors.backgroundColor,
                ),
                child: Text(stallDetails.pricePerEvent! + ' /-'),
              ),
              Container(
                alignment: Alignment.center,
                height: 20.h,
                width: 100.w,
                decoration: BoxDecoration(
                  color: AppColors.fontColor.withOpacity(0.5),
                ),
                child: Text('per event'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
