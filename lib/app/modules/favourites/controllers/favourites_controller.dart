import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/model/events_model.dart';

class FavouritesController extends GetxController {
  late PageController favouritePageController;

  final RxList<Events> events = [
    Events(
      month: 'April',
      weekDay: 'Sunday',
      title: 'Fashion Trends',
      date: 21,
      address: 'Eat Street, Tank Bund',
      stock: 'Full Stall',
      price: 10000,
      isFavoutite: true,
      newlyAdded: false,
    ),
    Events(
      month: 'April',
      weekDay: 'Sunday',
      title: 'Fashion Trends',
      date: 21,
      address: 'Eat Street, Tank Bund',
      stock: 'Full Stall',
      price: 10000,
      isFavoutite: true,
      newlyAdded: false,
    ),
    Events(
      month: 'April',
      weekDay: 'Sunday',
      title: 'Fashion Trends',
      date: 21,
      address: 'Eat Street, Tank Bund',
      stock: 'Full Stall',
      price: 10000,
      isFavoutite: false,
      newlyAdded: false,
    ),
    Events(
      month: 'April',
      weekDay: 'Sunday',
      title: 'Fashion Trends',
      date: 21,
      address: 'Eat Street, Tank Bund',
      stock: 'Full Stall',
      price: 10000,
      isFavoutite: true,
      newlyAdded: true,
    ),
    Events(
      month: 'April',
      weekDay: 'Sunday',
      title: 'Fashion Trends',
      date: 21,
      address: 'Eat Street, Tank Bund',
      stock: 'Full Stall',
      price: 10000,
      isFavoutite: false,
      newlyAdded: false,
    ),
  ].obs;

  final List<bool> citiesLogic = [
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  List<bool> filterToggle = [
    true,
    false,
    false,
  ];

  //functions
  void setFilter(index) {
    for (var i = 0; i < filterToggle.length; i++) {
      if (i == index) {
        // listPageController.animateToPage(
        //   index,
        //   duration: Duration(milliseconds: 300),
        //   curve: Curves.easeOut,
        // );
        filterToggle[index] = true;
      } else {
        filterToggle[i] = false;
      }
    }

    update();
  }

  void changeFilter(index) {
    for (var i = 0; i < filterToggle.length; i++) {
      if (i == index) {
        favouritePageController.animateToPage(
          index,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
        filterToggle[index] = true;
      } else {
        filterToggle[i] = false;
      }
    }

    update();
  }

  void setFavourite(int index) {
    for (var i = 0; i < events.length; i++) {
      if (i == index) {
        if (events[i].isFavoutite == true) {
          events[i].isFavoutite = false;
        } else {
          events[i].isFavoutite = true;
        }
      }
    }
  }

  @override
  void onInit() {
    favouritePageController = PageController();
    super.onInit();
  }

  @override
  void onClose() {
    favouritePageController.dispose();
    super.onClose();
  }
}
