import 'package:bookmystall/app/common/styles/colors.dart';
import 'package:bookmystall/app/common/styles/text_style.dart';
import 'package:bookmystall/app/modules/home/controllers/home_controller.dart';
import 'package:bookmystall/app/modules/home/model/events_api_model.dart';
import 'package:bookmystall/app/modules/home/views/widgets/event_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'widgets/row_container.dart';

class EventView extends GetView<HomeController> {
  final Data event;

  EventView({required this.event});
  @override
  Widget build(BuildContext context) {
    final toMonth =
        DateFormat().format(DateTime.parse(event.toTime!)).split(' ')[0];
    final fromMonth =
        DateFormat().format(DateTime.parse(event.fromTime!)).split(' ')[0];
    final toDay = int.parse(
      DateFormat()
          .format(DateTime.parse(event.toTime!))
          .split(' ')[1]
          .replaceRange(2, null, ' '),
    );
    final fromDay = int.parse(
      DateFormat()
          .format(DateTime.parse(event.fromTime!))
          .split(' ')[1]
          .replaceRange(2, null, ' '),
    );
    return Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBar(
          backgroundColor: AppColors.backgroundColor,
          elevation: 0,
          automaticallyImplyLeading: false,
          leadingWidth: 50,
          leading: InkWell(
            onTap: () => Get.back(),
            child: Container(
              height: 36.r,
              width: 36.r,
              margin: EdgeInsets.only(left: 10.w),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.whiteColor,
              ),
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.black,
                size: 20.r,
              ),
            ),
          ),
          actions: [
            InkWell(
              // onTap: () => Get.back(),
              child: Container(
                height: 36.r,
                width: 36.r,
                margin: EdgeInsets.only(right: 10.w),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: AppColors.whiteColor),
                child: Icon(
                  event.isFavorited!
                      ? Icons.favorite
                      : Icons.favorite_outline_outlined,
                  color: event.isFavorited!
                      ? AppColors.pinkColor
                      : AppColors.fontColor,
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            // alignment: Alignment.center,
            children: [
              EventHeader(
                event: event,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.w, right: 10.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Divider(
                      color: AppColors.fontColor,
                      thickness: 1.5,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      event.eventName!,
                      style: MyTextstyles.cardTextStyle.copyWith(
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      event.venue!.firstLine! +
                          '\n' +
                          event.venue!.secondLine! +
                          '\n' +
                          event.city!,
                      style: MyTextstyles.mediumTextStyle.copyWith(
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Text(
                      '$fromDay $fromMonth - $toDay $toMonth',
                      style: MyTextstyles.mediumTextStyle.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text('10 am - 8 pm', style: MyTextstyles.mediumTextStyle),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      '3.2Kms from here.',
                      style: MyTextstyles.mediumTextStyle.copyWith(
                        color: Colors.green,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'Visitors Expected ${event.minExpectedVisitors}',
                      style: MyTextstyles.mediumTextStyle.copyWith(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Divider(
                      color: AppColors.fontColor,
                      thickness: 1.5,
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 15.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Stall Prices',
                              style: MyTextstyles.cardTextStyle.copyWith(
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              'Total Stalls - ${event.totalNoOfStalls}',
                              style: MyTextstyles.smallTextStyle.copyWith(
                                  // color: Colors.black,
                                  ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              'Available Stalls Now - ${event.noOfStallsAvaliable}',
                              style: MyTextstyles.smallTextStyle.copyWith(
                                  // color: Colors.black,
                                  ),
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            ...List.generate(event.stallDetails!.length,
                                (index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                  bottom: event.stallDetails!.length == 1
                                      ? 40.h
                                      : 20.h,
                                ),
                                child: StockRow(
                                    stallDetails: event.stallDetails![index]),
                              );
                            })
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 70.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.backgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(6),
                    topRight: Radius.circular(6),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(6)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 40.w,
                          vertical: 8.h,
                        ),
                        child: Text('SHARE'),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(),
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(6)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 40.w,
                          vertical: 8.h,
                        ),
                        child: Text(
                          'Call Now',
                          style: MyTextstyles.mediumTextStyle.copyWith(
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}