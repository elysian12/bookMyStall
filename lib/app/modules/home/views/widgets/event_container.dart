import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../common/styles/colors.dart';
import '../../../../common/styles/text_style.dart';
import '../../controllers/home_controller.dart';
import '../../model/events_api_model.dart';
import 'favourite_icon.dart';

class EventContainer extends StatelessWidget {
  const EventContainer({
    Key? key,
    required this.day,
    required this.month,
    required this.weekDay,
    required this.event,
    required this.index,
  }) : super(key: key);

  final String day;
  final String month;
  final String weekDay;
  final Data event;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.21.w),
      child: Stack(
        children: [
          Container(
            margin: index == 0
                ? EdgeInsets.only(top: 10, bottom: 10)
                : EdgeInsets.only(bottom: 10),
            height: 140.h,
            padding: EdgeInsets.only(top: 15.h),
            color: AppColors.backgroundColor,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        day,
                        style: MyTextstyles.cardTextStyle,
                      ),
                      Text(
                        month,
                        style: MyTextstyles.cardTextStyle.copyWith(
                          fontSize: 19.sp,
                        ),
                      ),
                      Text(
                        weekDay,
                        style: MyTextstyles.smallTextStyle,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 25.h),
                  child: VerticalDivider(
                    color: Colors.black,
                    thickness: 0.7,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              event.eventName!,
                              style: MyTextstyles.mediumTextStyle,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              event.venue!.firstLine!,
                              style: MyTextstyles.mediumTextStyle,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              event.stallDetails![0].typeOfStall! +
                                  '  ${event.stallDetails![0].pricePerDay}/-',
                              style: MyTextstyles.mediumTextStyle,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      GetBuilder<HomeController>(builder: (controller) {
                        return FavouriteIconButton(
                          event: event,
                          onTap: () {
                            controller.setFavourite(index, event.eventID!);
                          },
                        );
                      }),
                      SizedBox(
                        height: 20.w,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // event.newlyAdded
          //     ? Positioned(
          //         top: 16.h,
          //         left: 20.w,
          //         child: Row(
          //           children: [
          //             Icon(
          //               Icons.info_outline_rounded,
          //               color: Colors.green,
          //               size: 16.sp,
          //             ),
          //             Text(
          //               ' Newly Added',
          //               style: MyTextstyles
          //                   .mediumTextStyle
          //                   .copyWith(
          //                 color: Colors.green,
          //                 fontWeight: FontWeight.normal,
          //               ),
          //             ),
          //           ],
          //         ),
          //       )
          //     : SizedBox.shrink(),
        ],
      ),
    );
  }
}
