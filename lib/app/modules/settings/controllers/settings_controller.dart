import 'package:bookmystall/app/data/services/sharedServices/shared_service.dart';
import 'package:get/get.dart';

import '../../../common/costants/helper.dart';
import '../../home/model/city_model.dart';

class SettingsController extends GetxController {
  final List<CityModel> cities = [
    CityModel(
        img: '${Helper.homeIcon}1.png', label: 'Banglore', isSelected: false),
    CityModel(img: '${Helper.homeIcon}2.png', label: 'Agra'),
    CityModel(img: '${Helper.homeIcon}3.png', label: 'Mumbai'),
    CityModel(img: '${Helper.homeIcon}4.png', label: 'Hyderabad'),
    CityModel(img: '${Helper.homeIcon}5.png', label: 'Goa'),
  ];

  void showCity(index) async {
    MySharedService().setSharedCity(cities[index].label);

    Get.back();
  }

  void setDefault() async {
    final sharedCity = await MySharedService().getSharedCity().then((value) {
      MySharedService().setSharedCity(value!);
    });

    Get.back();
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
