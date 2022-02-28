import 'package:bookmystall/app/modules/home/views/event_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../common/styles/colors.dart';
import '../../../common/styles/text_style.dart';

import '../../home/views/widgets/event_container.dart';
import '../../home/views/widgets/toogle_container.dart';
import '../controllers/favourites_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavouritesView extends GetView<FavouritesController> {
  @override
  Widget build(BuildContext context) {
    // final homeController = Get.put(HomeController());
    if (controller.favouritePageController.hasClients) {
      controller.onClose();
      controller.onInit();
    }
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
          title: Obx(() {
            return Text(
              '${controller.eventsData.length} events saved by you',
              style: MyTextstyles.cardTextStyle.copyWith(
                color: Color(0xff50575B),
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
              ),
            );
          }),
          // centerTitle: true,
        ),
        body: Column(
          children: [
            ToggleWidget(
              isFavouriteView: true,
            ),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              width: Get.width,
              height: Get.height * 0.732.h,
              child: PageView.builder(
                  controller: controller.favouritePageController,
                  onPageChanged: (pageIndex) {
                    controller.changeFilter(pageIndex);
                  },
                  itemCount: controller.filterToggle.length,
                  itemBuilder: (context, int index) {
                    return SingleChildScrollView(
                      // controller: ScrollController(),
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

                                    final day =
                                        DateTime.parse(event.toTime!).day;
                                    print(day);
                                    return event.isFavorited!
                                        ? InkWell(
                                            onTap: () {
                                              print(
                                                  '--------------------------Hello');
                                              Get.to(
                                                () => EventView(
                                                  event: event,
                                                  index: index,
                                                  isFavouriteView: true,
                                                ),
                                              );
                                            },
                                            child: EventContainer(
                                              day: day.toString(),
                                              month: month,
                                              weekDay: weekDay,
                                              event: event,
                                              index: index,
                                              isFavouriteScreen: true,
                                            ),
                                          )
                                        : SizedBox.shrink();
                                  },
                                ),
                              )
                            : Container(
                                width: Get.width,
                                height: Get.height * 0.732.h,
                                alignment: Alignment.center,
                                child: Text('No Favourite Events'),
                              );
                      }),
                    );
                  }),
            )
          ],
        ));
  }
}
