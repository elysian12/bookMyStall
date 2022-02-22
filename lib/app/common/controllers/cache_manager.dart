import 'package:bookmystall/app/data/services/sharedServices/shared_service.dart';
import 'package:get/state_manager.dart';

class CacheManger extends GetxController {
  String? token;

  void getToken() async {
    token = await MySharedService().getSharedToken();
    print('-----------------$token-----------------');
  }

  @override
  void onInit() {
    getToken();
    super.onInit();
  }
}
