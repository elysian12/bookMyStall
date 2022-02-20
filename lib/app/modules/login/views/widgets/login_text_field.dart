import 'package:bookmystall/app/common/styles/colors.dart';
import 'package:bookmystall/app/common/styles/text_style.dart';
import 'package:bookmystall/app/common/widgets/loading_screen.dart';
import 'package:bookmystall/app/modules/login/controllers/login_controller.dart';
import 'package:bookmystall/app/modules/login/views/widgets/bottom_sheet.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginTextField extends StatelessWidget {
  final TextEditingController loginController;

  const LoginTextField({Key? key, required this.loginController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final conroller = Get.put(LoginController());
    return Container(
      height: Get.height * 0.055,
      // width: Get.width,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Stack(
        children: [
          TextFormField(
            cursorColor: AppColors.pinkColor,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              isDense: true,
              // isCollapsed: true,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.whiteColor),
                borderRadius: BorderRadius.circular(5),
              ),
              prefixIconConstraints: BoxConstraints(),

              prefixIcon: SizedBox(
                height: Get.height * 0.10,
                // width: Get.width * 0.25,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 1),
                  child: CountryCodePicker(
                    initialSelection: 'In',
                    showCountryOnly: false,
                    favorite: ['+91'],
                    padding: EdgeInsets.zero,
                    flagWidth: 20,
                    hideSearch: true,
                    dialogSize: Size(200, 400),
                    textStyle: MyTextstyles.mediumTextStyle.copyWith(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.whiteColor),
                borderRadius: BorderRadius.circular(5),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.whiteColor),
                borderRadius: BorderRadius.circular(5),
              ),
              hintStyle: TextStyle(
                color: AppColors.pinkColor,
              ),
            ),
            controller: loginController,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              height: Get.height * 0.06,
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(AppColors.pinkColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      side: BorderSide(
                        color: AppColors.pinkColor,
                      ),
                    ),
                  ),
                ),
                onPressed: () {
                  conroller.requestOtp(int.parse(loginController.text));
                  if (conroller.isLoading.value != false) {
                    Get.bottomSheet(OtpBottomSheet(
                      textEditingController: loginController,
                    ));
                  }
                },
                child: Icon(
                  Icons.arrow_forward,
                  color: AppColors.whiteColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
