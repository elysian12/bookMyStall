import 'package:bookmystall/app/modules/favourites/controllers/favourites_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../common/styles/colors.dart';
import '../../controllers/home_controller.dart';
import 'toogle.dart';

class ToggleWidget extends GetView<HomeController> {
  final bool isFavouriteView;
  const ToggleWidget({
    Key? key,
    required this.isFavouriteView,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    // final favController = Get.find<FavouritesController>();
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
          return isFavouriteView
              ? GetBuilder<FavouritesController>(
                  init: null,
                  builder: (controller) {
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
                  })
              : GetBuilder<HomeController>(
                  init: null,
                  builder: (controller) {
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
