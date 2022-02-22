import 'package:bookmystall/app/common/styles/theme.dart';
import 'package:bookmystall/app/data/services/sharedServices/shared_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  FlutterNativeSplash.removeAfter(initialization);
  runApp(MyApp());
}

void initialization(BuildContext context) async {
  // This is where you can initialize the resources needed by your app while
  // the splash screen is displayed.  Remove the following example because

  await Future.delayed(const Duration(seconds: 1));
  print('go!');
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              child: FutureBuilder(
                  future: MySharedService().getSharedToken(),
                  builder: (context, snapshot) {
                    return GetMaterialApp(
                      debugShowCheckedModeBanner: false,
                      title: "Book My Stall",
                      initialRoute: snapshot.data != null
                          ? Routes.BOTTOMNAVIGATION
                          : Routes.LOGIN,
                      getPages: AppPages.routes,
                    );
                  }),
            );
          },
        );
      },
    );
  }
}

//c6334f
	// dc4f34
