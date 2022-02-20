import 'package:bookmystall/app/modules/home/controllers/home_controller.dart';
import 'package:bookmystall/app/modules/home/views/event_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../common/styles/colors.dart';
import '../../../common/styles/text_style.dart';
import '../../home/views/home_view.dart';
import '../../home/views/widgets/favourite_icon.dart';
import '../controllers/favourites_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavouritesView extends GetView<FavouritesController> {
  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 80.h,
          backgroundColor: AppColors.appBarColor,
          elevation: 0,
          automaticallyImplyLeading: false,
          // iconTheme: ,
          leadingWidth: 50,

          leading: InkWell(
            // onTap: () => Get.back(),
            child: Container(
              height: 36.r,
              width: 36.r,
              margin: EdgeInsets.only(left: 10.w),
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: AppColors.whiteColor),
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.black,
                size: 20.r,
              ),
            ),
          ),
          title: Text(
            '${homeController.eventsData.length} events saved by you',
            style: MyTextstyles.cardTextStyle.copyWith(
              color: Color(0xff50575B),
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          // centerTitle: true,
        ),
        body: Column(
          children: [
            ToggleWidget(),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              width: Get.width,
              height: Get.height * 0.732.h,
              child: PageView.builder(
                  // controller: controller.pageController,
                  onPageChanged: (pageIndex) {
                    // controller.setFilter(pageIndex);
                  },
                  itemCount: controller.filterToggle.length,
                  itemBuilder: (context, int index) {
                    return SingleChildScrollView(
                      child: Obx(() {
                        return homeController.eventsData.isNotEmpty
                            ? Column(
                                children: List.generate(
                                  homeController.eventsData.length,
                                  (index) {
                                    final event =
                                        homeController.eventsData[index];
                                    final month = DateFormat()
                                        .format(DateTime.parse(event.toTime!))
                                        .split(' ')[0];
                                    final dateTime =
                                        DateTime.parse(event.toTime!);
                                    final df = DateFormat.yMMMMEEEEd();
                                    final weekDay =
                                        df.format(dateTime).split(' ')[0];

                                    final day = DateFormat()
                                        .format(DateTime.parse(event.toTime!))
                                        .split(' ')[1];
                                    print(DateFormat()
                                        .format(DateTime.parse(event.toTime!)));
                                    return event.isFavorited!
                                        ? InkWell(
                                            onTap: () {
                                              print(
                                                  '--------------------------Hello');
                                              Get.to(() =>
                                                  EventView(event: event));
                                            },
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 5.21.w),
                                              child: Stack(
                                                children: [
                                                  Container(
                                                    margin: index == 0
                                                        ? EdgeInsets.only(
                                                            top: 10, bottom: 10)
                                                        : EdgeInsets.only(
                                                            bottom: 10),
                                                    height: 140.h,
                                                    padding: EdgeInsets.only(
                                                        top: 15.h),
                                                    color: AppColors
                                                        .backgroundColor,
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          flex: 1,
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Text(
                                                                day,
                                                                style: MyTextstyles
                                                                    .cardTextStyle,
                                                              ),
                                                              Text(
                                                                month,
                                                                style: MyTextstyles
                                                                    .cardTextStyle,
                                                              ),
                                                              Text(
                                                                weekDay,
                                                                style: MyTextstyles
                                                                    .smallTextStyle,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  vertical:
                                                                      25.h),
                                                          child:
                                                              VerticalDivider(
                                                            color: Colors.black,
                                                            thickness: 0.7,
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 3,
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceAround,
                                                            children: [
                                                              Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        right: 10
                                                                            .w),
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      event
                                                                          .eventName!,
                                                                      style: MyTextstyles
                                                                          .mediumTextStyle,
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          5.h,
                                                                    ),
                                                                    Text(
                                                                      event
                                                                          .venue!
                                                                          .firstLine!,
                                                                      style: MyTextstyles
                                                                          .mediumTextStyle,
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          5.h,
                                                                    ),
                                                                    Text(
                                                                      event.stallDetails![0]
                                                                              .typeOfStall! +
                                                                          '  ${event.stallDetails![0].pricePerDay}/-',
                                                                      style: MyTextstyles
                                                                          .mediumTextStyle,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              GetBuilder<
                                                                      HomeController>(
                                                                  builder:
                                                                      (controller) {
                                                                return FavouriteIconButton(
                                                                  event: event,
                                                                  onTap: () {
                                                                    homeController
                                                                        .setFavourite(
                                                                      index,
                                                                      event
                                                                          .eventID!,
                                                                    );
                                                                  },
                                                                );
                                                              }),
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
                                            ),
                                          )
                                        : SizedBox.shrink();
                                  },
                                ),
                              )
                            : Center(
                                child: CircularProgressIndicator(),
                              );
                      }),
                    );
                  }),
            )
          ],
        ));
  }
}
