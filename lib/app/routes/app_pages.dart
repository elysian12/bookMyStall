import 'package:get/get.dart';

import '../modules/bottomnavigation/bindings/bottomnavigation_binding.dart';
import '../modules/bottomnavigation/views/bottomnavigation_view.dart';
import '../modules/favourites/bindings/favourites_binding.dart';
import '../modules/favourites/views/favourites_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/settings/bindings/settings_binding.dart';
import '../modules/settings/views/settings_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      // binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOMNAVIGATION,
      page: () => BottomNavigationView(),
      binding: BottomnavigationBinding(),
    ),
    GetPage(
      name: _Paths.FAVOURITES,
      page: () => FavouritesView(),
      binding: FavouritesBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => SettingsView(),
      binding: SettingsBinding(),
    ),
  ];
}
