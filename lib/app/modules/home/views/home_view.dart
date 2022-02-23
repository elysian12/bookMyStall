import 'package:bookmystall/app/common/styles/colors.dart';
import 'package:bookmystall/app/common/styles/text_style.dart';
import 'package:bookmystall/app/modules/home/views/widgets/event_container.dart';
import 'package:bookmystall/app/modules/home/views/widgets/toogle_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

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
                        isSelected: controller.cities[index].isSelected,
                        label: controller.cities[index].label,
                        img: controller.cities[index].img,
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
            child: Obx(() {
              return Text(
                '${controller.eventsData.length} events available',
                style: MyTextstyles.cardTextStyle.copyWith(
                  color: Color(0xff50575B),
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                ),
              );
            }),
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
                                      Get.to(() => EventView(
                                            event: event,
                                            index: index,
                                            isFavouriteView: false,
                                          ));
                                    },
                                    child: EventContainer(
                                      day: day,
                                      month: month,
                                      weekDay: weekDay,
                                      event: event,
                                      index: index,
                                      isFavouriteScreen: false,
                                    ),
                                  );
                                },
                              ),
                            )
                          : Center(
                              child: Container(
                                height: Get.height * 0.61,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // Text('No Events Available'),
                                    CircularProgressIndicator()
                                  ],
                                ),
                              ),
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

class CityContainer extends StatelessWidget {
  final String label;
  final String img;
  final bool isSelected;
  final void Function()? onTap;
  const CityContainer({
    Key? key,
    required this.label,
    required this.isSelected,
    this.onTap,
    required this.img,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print(img);
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.pinkColor,
            radius: isSelected ? 21.r : 19.r,
            child: CircleAvatar(
              backgroundImage: AssetImage(img),
              radius: 19.r,
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
