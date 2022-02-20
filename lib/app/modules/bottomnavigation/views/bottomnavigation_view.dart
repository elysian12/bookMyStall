import 'package:bookmystall/app/common/controllers/internet_controller.dart';
import 'package:bookmystall/app/common/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/bottomnavigation_controller.dart';

class BottomNavigationView extends GetView<BottomNavigationController> {
  @override
  Widget build(BuildContext context) {
    // final internetController = Get.put(ConnectivityProvider());
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('BottomnavigationView'),
      //   centerTitle: true,
      // ),
      body: Navigator(
        key: Get.nestedKey(1),
        initialRoute: Routes.HOME,
        onGenerateRoute: controller.onGenerateRoute,
      ),
      bottomNavigationBar: MyBottomBar(),
    );
  }
}
