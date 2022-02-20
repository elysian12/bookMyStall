import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/styles/colors.dart';
import '../../../../common/styles/text_style.dart';
import '../../model/events_api_model.dart';
import 'custom_cliper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventHeader extends StatelessWidget {
  final Data event;
  const EventHeader({
    Key? key,
    required this.event,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final toDay = DateTime.parse(event.toTime!);

    final fromDay = DateTime.parse(event.fromTime!);
    final dateTimeGap = toDay.difference(fromDay).inDays;

    return Container(
      height: 300.h,
      width: double.infinity,
      child: Stack(alignment: Alignment.center, children: [
        Align(
          alignment: Alignment.topCenter,
          child: ClipPath(
            clipper: MyClipper(),
            child: Container(
              height: Get.height * 0.15,
              width: Get.width,
              decoration: BoxDecoration(
                color: AppColors.backgroundColor,
              ),
            ),
          ),
        ),
        Positioned(
          top: 40.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                height: 222.h,
                width: 220.h,
                padding: EdgeInsets.only(
                  left: 20.w,
                  top: 10.h,
                  bottom: 10.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 24.h,
                      width: 110.w,
                      decoration: BoxDecoration(
                        // color: AppColors.backgroundColor,
                        border: Border.all(
                          color: AppColors.fontColor.withOpacity(0.6),
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Event Verified',
                            style: MyTextstyles.smallTextStyle.copyWith(
                              color: AppColors.fontColor,
                            ),
                          ),
                          Icon(
                            Icons.clear,
                            color: AppColors.fontColor,
                            size: 15.h,
                          )
                        ],
                      ),
                    ),
                    Spacer(),
                    Text(
                      'Event ID : ${event.eventID}',
                      style: MyTextstyles.cardTextStyle.copyWith(
                        color: Colors.black,
                        fontSize: 17.sp,
                      ),
                    ),
                    Text(
                      '$dateTimeGap Days Event',
                      style: MyTextstyles.smallTextStyle,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(event.imageURL1!)),
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      offset: Offset(0, 0),
                      spreadRadius: 0.1,
                      blurRadius: 2,
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      offset: Offset(-1, 2),
                      spreadRadius: 0.1,
                      blurRadius: 1,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                height: 24.h,
                width: 107.w,
                decoration: BoxDecoration(
                  // color: AppColors.backgroundColor,
                  border: Border.all(
                    color: AppColors.fontColor.withOpacity(0.6),
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Report Event',
                      style: MyTextstyles.smallTextStyle.copyWith(
                        color: AppColors.fontColor,
                      ),
                    ),
                    Icon(
                      Icons.info_outline_rounded,
                      color: AppColors.fontColor,
                      size: 15.h,
                    )
                  ],
                ),
              ),
              // SizedBox(
              //   height: 10.h,
              // ),
            ],
          ),
        ),
      ]),
    );
  }
}
