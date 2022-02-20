import 'dart:ui';

import 'package:bookmystall/app/modules/login/views/widgets/login_text_field.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: Get.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/backGround.jpg',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
            child: Container(
              decoration:
                  new BoxDecoration(color: Colors.black.withOpacity(0.4)),
            ),
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: LoginTextField(
          loginController: controller.loginController,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
