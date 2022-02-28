import 'dart:io';
import 'dart:math';

import 'package:bookmystall/app/data/providers/event_favourite_provider.dart';
import 'package:bookmystall/app/data/providers/events_provider.dart';
import 'package:bookmystall/app/data/services/sharedServices/shared_service.dart';
import 'package:bookmystall/app/modules/favourites/controllers/favourites_controller.dart';
import 'package:bookmystall/app/modules/home/model/city_model.dart';
import 'package:bookmystall/app/modules/home/model/events_api_model.dart';
import 'package:bookmystall/app/modules/home/model/favourite_model.dart';
import 'package:bookmystall/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

import '../../../common/costants/helper.dart';
import 'package:path_provider/path_provider.dart';

class HomeController extends GetxController {
  late PageController homePageController;
  late ScreenshotController screenshotController;
  FavouriteModel favouriteModel = FavouriteModel();

  RxBool isLoading = false.obs;

  double? currentEventLat;
  double? currentEventLong;
  double? currentDistance;
  // File? imagePath;

  final List<CityModel> cities = [
    CityModel(
        img: '${Helper.homeIcon}1.png', label: 'Banglore', isSelected: false),
    CityModel(img: '${Helper.homeIcon}2.png', label: 'Agra'),
    CityModel(img: '${Helper.homeIcon}3.png', label: 'Mumbai'),
    CityModel(img: '${Helper.homeIcon}4.png', label: 'Hyderabad'),
    CityModel(img: '${Helper.homeIcon}5.png', label: 'Goa'),
  ];

  List<bool> filterToggle = [
    true,
    false,
    false,
  ];

  RxList<Data> eventsData = <Data>[].obs;
  Location location = new Location();
  //functions

  void changeFilter(index) {
    for (var i = 0; i < filterToggle.length; i++) {
      if (i == index) {
        homePageController.animateToPage(
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

  void setFavourite(index, int eventId) {
    final favouritesController = Get.put(FavouritesController());
    for (var i = 0; i < eventsData.length; i++) {
      if (i == index) {
        if (eventsData[i].isFavorited == true) {
          eventsData[i].isFavorited = false;
          favouriteEvent(isFavourite: false, eventId: eventId);
          eventsData.refresh();
        } else {
          eventsData[i].isFavorited = true;
          favouriteEvent(isFavourite: true, eventId: eventId);
          favouritesController.eventsData.add(eventsData[i]);
          eventsData.refresh();
        }
      }
    }
    update();
  }

  void setCity(int index) {
    for (var i = 0; i < cities.length; i++) {
      if (i == index) {
        print(i);
        print(cities[i].label);
        cities[i].isSelected = true;
        requestEvents(cities[i].label);
        eventsData.refresh();
      } else {
        cities[i].isSelected = false;
        // requestEvents(cities[i].label);
      }
    }
    update();
  }

  //api functions
  Future<void> requestEvents(String? city) async {
    isLoading.value = true;
    final token = await MySharedService().getSharedToken();
    EventProvider().requestEvent(
      cityName: city!,
      token: token!,
      beforeSend: () {},
      onSuccess: (res) {
        print('-----------${res.success}--------1-----${res.message}');
        if (res.success!) {
          eventsData.value = res.data!;
          isLoading.value = false;
        } else {
          eventsData.value = [];
          isLoading.value = false;
        }
      },
      onError: (error) {
        print('---------------$error-----------');
      },
    );
  }

  void favouriteEvent({required bool isFavourite, required int eventId}) async {
    final token = await MySharedService().getSharedToken();
    final phone = await MySharedService().getSharedPhone();
    favouriteModel.eventID = eventId;
    favouriteModel.isFavorite = isFavourite;
    favouriteModel.mobileNumber = phone;
    EventFavouriteProvider().favourite(
      token: token!,
      favouriteModel: favouriteModel,
      beforeSend: () {},
      onSuccess: (res) {
        print('-----------${res.success}--------1-----${res.message}');
        // eventsData.value = res.data!;
      },
      onError: (error) {
        print('---------------$error-----------');
      },
    );
  }

  void showCity(index) async {
    // requestEvents(cities[3].label);
    final sharedCity = await MySharedService().getSharedCity();
    if (sharedCity == null) {
      MySharedService().setSharedCity(cities[index].label);
      await requestEvents(cities[index].label).then((value) {
        cities[index].isSelected = true;
        Get.offAllNamed(Routes.BOTTOMNAVIGATION);
      });
      update();
    } else {
      requestEvents(sharedCity);

      // Get.toNamed(Routes.BOTTOMNAVIGATION);
      for (var i = 0; i < cities.length; i++) {
        if (sharedCity == cities[i].label) {
          cities[i].isSelected = true;
          isLoading.value = false;
          update();
        }
      }
    }
  }

  void showDefaultCity() async {
    // requestEvents(cities[3].label);
    isLoading.value = true;
    final sharedCity = await MySharedService().getSharedCity();
    if (sharedCity == null) {
      return;
    } else {
      requestEvents(sharedCity);
      isLoading.value = false;
      // Get.toNamed(Routes.BOTTOMNAVIGATION);
      for (var i = 0; i < cities.length; i++) {
        if (sharedCity == cities[i].label) {
          cities[i].isSelected = true;
          isLoading.value = false;
          update();
        }
      }
    }
  }

  Future<LocationData> getCurrentLocation() async {
    LocationData _locationData;
    _locationData = await location.getLocation();
    return _locationData;
  }

  void calculateDistance() async {
    if (currentEventLat == null && currentEventLong == null) {
      return;
    }
    LocationData _locationData = await getCurrentLocation();
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((currentEventLat! - _locationData.latitude!) * p) / 2 +
        c(_locationData.latitude! * p) *
            c(currentEventLat! * p) *
            (1 - c((currentEventLong! - _locationData.longitude!) * p)) /
            2;
    currentDistance = 12742 * asin(sqrt(a));
    // update();
  }

  void ssAndShare(String text) async {
    // print(hello)
    final imageFile = await screenshotController.capture();
    if (imageFile != null) {
      final directory = await getApplicationDocumentsDirectory();
      final imagePath = await File('${directory.path}/image.png').create();
      await imagePath.writeAsBytes(imageFile);
      await Share.shareFiles(
        [imagePath.path],
        text: text,
        subject: text,
      );
    }
  }

  @override
  void onInit() {
    homePageController = PageController();
    screenshotController = ScreenshotController();
    super.onInit();
  }

  @override
  void onReady() {
    showDefaultCity();
    super.onReady();
  }

  @override
  void onClose() {
    homePageController.dispose();
    super.onClose();
  }
}
