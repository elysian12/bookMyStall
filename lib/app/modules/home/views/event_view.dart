import 'package:bookmystall/app/common/styles/colors.dart';
import 'package:bookmystall/app/common/styles/text_style.dart';
import 'package:bookmystall/app/modules/favourites/controllers/favourites_controller.dart';
import 'package:bookmystall/app/modules/home/controllers/home_controller.dart';
import 'package:bookmystall/app/modules/home/model/events_api_model.dart';
import 'package:bookmystall/app/modules/home/views/widgets/event_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:screenshot/screenshot.dart';
import 'package:url_launcher/url_launcher.dart';

import 'widgets/row_container.dart';

class EventView extends GetView<HomeController> {
  final Data event;
  final int index;
  final bool isFavouriteView;

  EventView({
    required this.event,
    required this.index,
    required this.isFavouriteView,
  });
  @override
  Widget build(BuildContext context) {
    // controller.currentEventLat =
    //     event.venue == null ? null : double.parse(event.venue!.latitude!);
    // controller.currentEventLong =
    //     event.venue == null ? null : double.parse(event.venue!.longitude!);
    // controller.calculateDistance();
    final toMonth =
        DateFormat().format(DateTime.parse(event.toTime!)).split(' ')[0];
    final fromMonth =
        DateFormat().format(DateTime.parse(event.fromTime!)).split(' ')[0];
    final toDay = DateTime.parse(event.toTime!).day;

    final fromDay = DateTime.parse(event.fromTime!).day;

    final toTimeHour = DateFormat()
        .format(DateTime.parse(event.toTime!))
        .split(' ')[3]
        .split(':')[0];
    final fromTimeHour = DateFormat()
        .format(DateTime.parse(event.fromTime!))
        .split(' ')[3]
        .split(':')[0];

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
                onTap: () {
                  final favouritesController = Get.put(FavouritesController());
                  isFavouriteView
                      ? favouritesController.setFavourite(index, event.eventID!)
                      : controller.setFavourite(index, event.eventID!);
                },
                child: Container(
                  height: 36.r,
                  width: 36.r,
                  margin: EdgeInsets.only(right: 10.w),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: AppColors.whiteColor),
                  child: isFavouriteView
                      ? GetBuilder<FavouritesController>(builder: (controller) {
                          return Icon(
                            event.isFavorited!
                                ? Icons.favorite
                                : Icons.favorite_outline_outlined,
                            color: event.isFavorited!
                                ? AppColors.pinkColor
                                : AppColors.fontColor,
                          );
                        })
                      : GetBuilder<HomeController>(builder: (controller) {
                          return Icon(
                            event.isFavorited!
                                ? Icons.favorite
                                : Icons.favorite_outline_outlined,
                            color: event.isFavorited!
                                ? AppColors.pinkColor
                                : AppColors.fontColor,
                          );
                        }),
                )),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            // alignment: Alignment.center,
            children: [
              Screenshot(
                controller: controller.screenshotController,
                child: EventHeader(
                  event: event,
                ),
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
                    event.venue == null
                        ? Text('no data available')
                        : Text(
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
                    Text('$fromTimeHour am - $toTimeHour pm',
                        style: MyTextstyles.mediumTextStyle),
                    SizedBox(
                      height: 5.h,
                    ),
                    // Text(
                    //   '${controller.currentDistance}Kms from here.',
                    //   style: MyTextstyles.mediumTextStyle.copyWith(
                    //     color: Colors.green,
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 10.h,
                    // ),
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
                    InkWell(
                      onTap: () {
                        controller.ssAndShare(event.eventName!);
                      },
                      child: Container(
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
                    ),
                    InkWell(
                      onTap: () {
                        launch('tel://${event.mobileNumber}');
                      },
                      child: Container(
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
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
