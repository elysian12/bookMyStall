import 'package:bookmystall/app/common/widgets/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingOverlay extends StatelessWidget {
  final RxBool isLoading;
  final Widget? child;
  const LoadingOverlay({
    Key? key,
    required this.isLoading,
    required this.child,
  })  : assert(child != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return isLoading.value ? LoadingScreen() : child!;
    });
  }
}
