import 'package:bookmystall/app/common/styles/colors.dart';
import 'package:flutter/material.dart';

import '../../../../common/styles/text_style.dart';

class OtpTextField extends StatelessWidget {
  final bool first, last;
  final TextEditingController textEditingController;
  final void Function(String)? onFilledSubmitted;
  const OtpTextField({
    Key? key,
    required this.first,
    required this.last,
    required this.textEditingController,
    this.onFilledSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: AspectRatio(
        aspectRatio: 0.80,
        child: TextFormField(
          onFieldSubmitted: onFilledSubmitted,
          controller: textEditingController,
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.length == 0 && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: MyTextstyles.mediumTextStyle.copyWith(
            color: AppColors.fontColor,
            // fontSize: 12,
          ),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            // fillColor: AppColors.fontColor,
            // filled: true,
            counter: Offstage(),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.fontColor),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.fontColor),
            ),
          ),
        ),
      ),
    );
  }
}
