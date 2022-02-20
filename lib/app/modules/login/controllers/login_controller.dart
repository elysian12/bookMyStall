import 'dart:async';

import 'package:bookmystall/app/data/providers/login_provider.dart';
import 'package:bookmystall/app/data/services/sharedServices/shared_service.dart';
import 'package:bookmystall/app/modules/login/models/verify_otp_model.dart';
import 'package:bookmystall/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:location/location.dart';

class LoginController extends GetxController {
  final TextEditingController loginController = TextEditingController();
  final TextEditingController firstOTP = TextEditingController();
  final TextEditingController secondOTP = TextEditingController();
  final TextEditingController thirdOTP = TextEditingController();
  final TextEditingController fourOTP = TextEditingController();
  final TextEditingController fifthOTP = TextEditingController();
  final TextEditingController sixthOTP = TextEditingController();

  Location location = new Location();
  final RxInt otpTimer = 30.obs;
  final VerifyOtpRequestModel verifyOtpRequestModel = VerifyOtpRequestModel();

  void countDown() {
    const oneSec = const Duration(seconds: 1);
    final Timer _timer = Timer.periodic(oneSec, (Timer timer) {
      if (otpTimer.value == 0) {
        timer.cancel();
      } else {
        otpTimer.value--;
      }
    });
  }

  //function
  void requestPermissions() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    print(_locationData.time);
  }

  RxBool isLoading = true.obs;

  void requestOtp(int phoneNumber) {
    if (otpTimer.value == 0) {
      print('----3------3--- verify------Callled');
      otpTimer.value = 30;
      LoginProvider().requestOtp(
          phoneNumber: phoneNumber,
          // beforeSend: () {
          //   print('=----------------before send -----------');
          // },
          onSuccess: (res) {
            print(
                '-------------------------${res.message}----------${res.o}-------');
            isLoading.value = false;
            countDown();
          },
          onError: (error) {});
    } else {
      print('----3------3---------Callled');
      LoginProvider().requestOtp(
          phoneNumber: phoneNumber,
          // beforeSend: () {
          //   print('=----------------before send -----------');
          // },
          onSuccess: (res) {
            print(
                '-------------------------${res.message}----------${res.o}-------');
            isLoading.value = false;
            countDown();
          },
          onError: (error) {});
    }
  }

  void verifyOtp() {
    print('-----------Callled');
    if (!sixthOTP.text.isEmpty) {
      print('-----------1-----Callled');
      if (firstOTP.text.isNotEmpty &&
          secondOTP.text.isNotEmpty &&
          thirdOTP.text.isNotEmpty &&
          fourOTP.text.isNotEmpty &&
          fifthOTP.text.isNotEmpty &&
          loginController.text.isNotEmpty) {
        print('2-------2--------Callled');
        verifyOtpRequestModel.otp =
            '${firstOTP.text}${secondOTP.text}${thirdOTP.text}${fourOTP.text}${fifthOTP.text}${sixthOTP.text}';
        verifyOtpRequestModel.mobileNumber = loginController.text;
        print('----3------3---------Callled');
        print(
            '----3------3---------${verifyOtpRequestModel.toJson()}----------');
        LoginProvider().verifyOtp(
            verifyOtpRequestModel: verifyOtpRequestModel,
            // beforeSend: () {
            //   print('=----------------before send -----------');
            // },
            onSuccess: (res) async {
              print(
                  '-------------------------${res.message}----------${res.success}-------');
              isLoading.value = false;
              if (res.success!) {
                await MySharedService()
                    .setSharedPhone(res.userData!.mobileNumber!);
                await MySharedService()
                    .setSharedService(res.userData!.authToken!)
                    .then((value) {
                  print('---------Shared service is compledted---------');
                  Get.toNamed(Routes.BOTTOMNAVIGATION);
                });
              } else {
                Get.dialog<AlertDialog>(AlertDialog(
                  title: Text(res.message!),
                  content: Text('Incorrect OTP'),
                  actions: [
                    TextButton(
                      child: Text('Ok'),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ],
                ));
              }
            },
            onError: (error) {
              print('------------$error-------------');
            });
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    requestPermissions();

    super.onReady();
  }

  @override
  void onClose() {}
}
