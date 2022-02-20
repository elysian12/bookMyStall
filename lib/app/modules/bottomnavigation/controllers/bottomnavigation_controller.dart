import 'package:bookmystall/app/modules/favourites/bindings/favourites_binding.dart';
import 'package:bookmystall/app/modules/favourites/views/favourites_view.dart';
import 'package:bookmystall/app/modules/settings/bindings/settings_binding.dart';
import 'package:bookmystall/app/modules/settings/views/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../home/views/home_view.dart';

class BottomNavigationController extends GetxController {
  var tabIndex = 0.obs;

  final pages = <String>[
    Routes.HOME,
    Routes.FAVOURITES,
    Routes.SETTINGS,
  ];

  void changePage(int index) {
    if (index != tabIndex.value) {
      tabIndex.value = index;
      Get.toNamed(
        pages[index],
        id: 1,
      );
    }
  }

  Route onGenerateRoute(RouteSettings settings) {
    if (settings.name == Routes.HOME) {
      return GetPageRoute(
        settings: settings,
        page: () => HomeView(),
      );
    } else if (settings.name == Routes.FAVOURITES) {
      return GetPageRoute(
        settings: settings,
        page: () => FavouritesView(),
        binding: FavouritesBinding(),
      );
    } else if (settings.name == Routes.SETTINGS) {
      return GetPageRoute(
        settings: settings,
        page: () => SettingsView(),
        binding: SettingsBinding(),
      );
    } else {
      return GetPageRoute(
        settings: settings,
        page: () => HomeView(),
      );
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
