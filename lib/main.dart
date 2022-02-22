import 'package:bookmystall/app/common/controllers/cache_manager.dart';
import 'package:bookmystall/app/common/styles/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getToken().then((value) => null);
  FlutterNativeSplash.removeAfter(initialization);
  runApp(MyApp());
}

Future<void> getToken() async {
  Get.put(CacheManger());
  await Future.delayed(const Duration(seconds: 1));
}

Future<void> initialization(BuildContext context) async {
  // Get.put(CacheManger());

  // await Future.delayed(const Duration(seconds: 1));
  // await Future.delayed(const Duration(seconds: 1));
  print('go!');
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cacheManager = Get.put(CacheManger());
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: () {
        ScreenUtil.setContext(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: appTheme(),
          builder: (context, widget) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: GetMaterialApp(
                debugShowCheckedModeBanner: false,
                title: "Book My Stall",
                initialRoute: cacheManager.token == null
                    ? Routes.LOGIN
                    : Routes.BOTTOMNAVIGATION,
                getPages: AppPages.routes,
              ),
            );
          },
        );
      },
    );
  }
}

//c6334f
	// dc4f34
