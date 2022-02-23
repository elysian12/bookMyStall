import 'package:bookmystall/app/common/styles/text_style.dart';
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
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/costants/helper.dart';
import '../views/widgets/popup_action.dart';

class HomeController extends GetxController {
  late PageController listPageController;
  FavouriteModel favouriteModel = FavouriteModel();
  late ScrollController scrollController;
  RxBool isLoading = true.obs;

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
        listPageController.animateToPage(
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
    final sharedCity = await MySharedService().getSharedCity();
    if (sharedCity == null) {
      return;
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

  @override
  void onInit() {
    listPageController = PageController();
    scrollController = ScrollController();

    super.onInit();
  }

  @override
  void onReady() {
    showDefaultCity();
    super.onReady();
  }

  @override
  void onClose() {
    listPageController.dispose();
    super.onClose();
  }
}
