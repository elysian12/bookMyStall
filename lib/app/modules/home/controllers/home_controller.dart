import 'package:bookmystall/app/data/providers/event_favourite_provider.dart';
import 'package:bookmystall/app/data/providers/events_provider.dart';
import 'package:bookmystall/app/data/services/sharedServices/shared_service.dart';
import 'package:bookmystall/app/modules/home/model/city_model.dart';
import 'package:bookmystall/app/modules/home/model/events_api_model.dart';
import 'package:bookmystall/app/modules/home/model/events_model.dart';
import 'package:bookmystall/app/modules/home/model/favourite_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  late PageController listPageController;
  FavouriteModel favouriteModel = FavouriteModel();
  late ScrollController scrollController;
  final List<CityModel> cities = [
    CityModel(img: '', label: 'Banglore'),
    CityModel(img: '', label: 'Agra'),
    CityModel(img: '', label: 'Mumbai'),
    CityModel(img: '', label: 'Hyderbad'),
    CityModel(img: '', label: 'Goa'),
    CityModel(img: '', label: 'Gujarat'),
    CityModel(img: '', label: 'Ahmedabad'),
    CityModel(img: '', label: 'Chennai'),
  ];

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
    for (var i = 0; i < eventsData.length; i++) {
      if (i == index) {
        if (eventsData[i].isFavorited == true) {
          eventsData[i].isFavorited = false;
          favouriteEvent(isFavourite: false, eventId: eventId);
          eventsData.refresh();
        } else {
          eventsData[i].isFavorited = true;
          favouriteEvent(isFavourite: true, eventId: eventId);
          eventsData.refresh();
        }
      }
    }
    update();
  }

  void setCity(int index) {
    for (var i = 0; i < citiesLogic.length; i++) {
      if (i == index) {
        print(i);
        citiesLogic[i] = true;
      } else {
        citiesLogic[i] = false;
      }
    }
    update();
  }

  //api functions
  void requestEvents() async {
    final token = await MySharedService().getSharedToken();
    EventProvider().requestEvent(
      cityName: 'Hyderabad',
      token: token!,
      beforeSend: () {},
      onSuccess: (res) {
        print('-----------${res.success}--------1-----${res.message}');
        eventsData.value = res.data!;
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

  @override
  void onInit() {
    listPageController = PageController();
    scrollController = ScrollController();
    requestEvents();
    super.onInit();
  }

  @override
  void onClose() {
    listPageController.dispose();
    super.onClose();
  }
}
