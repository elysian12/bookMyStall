import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/providers/event_favourite_provider.dart';
import '../../../data/services/sharedServices/shared_service.dart';
import '../../home/model/events_api_model.dart';
import '../../home/model/favourite_model.dart';

class FavouritesController extends GetxController {
  late PageController favouritePageController;
  FavouriteModel favouriteModel = FavouriteModel();

  //initial
  RxList<Data> eventsData = <Data>[].obs;
  List<bool> filterToggle = [
    true,
    false,
    false,
  ];

  //functions
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

  void setFavourite(index, int eventId) {
    if (eventsData.isNotEmpty) {
      for (var i = 0; i < eventsData.length; i++) {
        if (i == index) {
          if (eventsData[i].isFavorited == true) {
            eventsData[i].isFavorited = false;
            favouriteEvent(isFavourite: false, eventId: eventId);
            eventsData.removeAt(i);
            eventsData.refresh();
          } else {
            eventsData[i].isFavorited = true;
            favouriteEvent(isFavourite: true, eventId: eventId);

            eventsData.refresh();
          }
        }
      }
    }
    update();
  }

  //api
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
    favouritePageController = PageController();
    super.onInit();
  }

  @override
  void onClose() {
    favouritePageController.dispose();
    super.onClose();
  }
}
