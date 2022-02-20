import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ConnectivityProvider extends GetxController {
  final Connectivity _connectivity = Connectivity();

  RxBool? _isOnline;

  RxBool? get isOnline => _isOnline!;

  Future<void> startMonitoring() async {
    await initConnectivity();

    _connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.none) {
        _isOnline!.value = false;
      } else {
        updateConnectionStatus().then((bool isconnected) {
          _isOnline?.value = isconnected;
        });
      }
    });
  }

  Future<void> initConnectivity() async {
    try {
      var status = await _connectivity.checkConnectivity();

      if (status == ConnectivityResult.none) {
        _isOnline?.value = false;
      } else {
        _isOnline?.value = true;
      }
    } on PlatformException catch (err) {
      print(err.toString());
    }
  }

  Future<bool> updateConnectionStatus() async {
    bool isConnected = true;

    try {
      final List<InternetAddress> result =
          await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        isConnected = true;
      }
    } on SocketException catch (_) {
      isConnected = false;
    }
    return isConnected;
  }

  void check() {
    if (_isOnline!.value) {
      print('---------------------Online-------------');
    } else {
      print('---------------------Offline-------------');
    }
  }

  @override
  void onInit() {
    print('-----started Monotioring');
    startMonitoring().whenComplete(() {
      check();
    });
    print('-----Continue Monotioring');

    super.onInit();
  }
}
