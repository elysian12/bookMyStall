import 'package:bookmystall/app/common/styles/colors.dart';
import 'package:bookmystall/app/common/styles/text_style.dart';
import 'package:bookmystall/app/modules/home/views/widgets/favourite_icon.dart';
import 'package:bookmystall/app/modules/home/views/widgets/toogle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../common/costants/helper.dart';
import '../controllers/home_controller.dart';
import 'event_view.dart';
import 'widgets/app_bar.dart';

class HomeView extends GetView<HomeController> {
  final homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: MyAppBar(),
      body: Column(
        children: [
          Container(
            height: 76.h,
            width: double.infinity,
            color: AppColors.appBarColor,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(controller.cities.length, (index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: GetBuilder<HomeController>(builder: (context) {
                      return CityContainer(
                        isSelected: controller.citiesLogic[index],
                        label: controller.cities[index].label,
                        onTap: () {
                          controller.setCity(index);
                        },
                      );
                    }),
                  );
                }),
              ),
            ),
          ),
          ToggleWidget(),
          Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: Text(
              '${controller.eventsData.length} events available',
              style: MyTextstyles.cardTextStyle.copyWith(
                color: Color(0xff50575B),
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            width: Get.width,
            height: Get.height * 0.61,
            child: PageView.builder(
                controller: controller.listPageController,
                onPageChanged: (pageIndex) {
                  controller.setFilter(pageIndex);
                },
                itemCount: controller.filterToggle.length,
                itemBuilder: (context, int index) {
                  return SingleChildScrollView(
                    controller: homeController.scrollController,
                    child: Obx(() {
                      return controller.eventsData.isNotEmpty
                          ? Column(
                              children: List.generate(
                                controller.eventsData.length,
                                (index) {
                                  final event = controller.eventsData[index];
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
                                  return InkWell(
                                    onTap: () {
                                      print('--------------------------Hello');
                                      Get.to(() => EventView(event: event));
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
                                                : EdgeInsets.only(bottom: 10),
                                            height: 140.h,
                                            padding: EdgeInsets.only(top: 15.h),
                                            color: AppColors.backgroundColor,
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
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
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 25.h),
                                                  child: VerticalDivider(
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
                                                        padding:
                                                            EdgeInsets.only(
                                                                right: 10.w),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              event.eventName!,
                                                              style: MyTextstyles
                                                                  .mediumTextStyle,
                                                            ),
                                                            SizedBox(
                                                              height: 5.h,
                                                            ),
                                                            Text(
                                                              event.venue!
                                                                  .firstLine!,
                                                              style: MyTextstyles
                                                                  .mediumTextStyle,
                                                            ),
                                                            SizedBox(
                                                              height: 5.h,
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
                                                            controller
                                                                .setFavourite(
                                                                    index,
                                                                    event
                                                                        .eventID!);
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
                                  );
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
      ),
    );
  }
}

class ToggleWidget extends StatelessWidget {
  const ToggleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    return Container(
      margin: EdgeInsets.only(top: 10.h),
      width: 269.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Get.width / 15),
        color: AppColors.backgroundColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children:
            List.generate(homeController.filterToggle.length, (listIndex) {
          return GetBuilder<HomeController>(builder: (controller) {
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 2.5.w,
                vertical: 1.w,
              ),
              child: FilterToggle(
                name: listIndex == 0
                    ? 'all events'
                    : listIndex == 1
                        ? 'this week'
                        : 'this month',
                isSelected: controller.filterToggle[listIndex],
                onTap: () {
                  controller.changeFilter(listIndex);
                },
              ),
            );
          });
        }),
      ),
    );
  }
}

class CityContainer extends StatelessWidget {
  final String label;
  final bool isSelected;
  final void Function()? onTap;
  const CityContainer(
      {Key? key, required this.label, required this.isSelected, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.pinkColor,
            radius: isSelected ? 21.r : 20.r,
            child: CircleAvatar(
              backgroundImage: AssetImage('${Helper.homeIcon}1.png'),
              radius: 20.r,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            label,
            style: isSelected
                ? TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  )
                : TextStyle(),
          ),
          SizedBox(
            height: 3.h,
          ),
          isSelected
              ? Container(
                  height: 4.h,
                  width: 60.w,
                  decoration: BoxDecoration(
                    color: AppColors.pinkColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
