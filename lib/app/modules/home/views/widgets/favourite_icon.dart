import 'package:bookmystall/app/modules/home/model/events_api_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/styles/colors.dart';

class FavouriteIconButton extends StatelessWidget {
  const FavouriteIconButton({Key? key, required this.event, this.onTap})
      : super(key: key);

  final Data event;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 48.r,
        width: 48.r,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.whiteColor,
        ),
        child: Icon(
          event.isFavorited! ? Icons.favorite : Icons.favorite_outline_outlined,
          color: event.isFavorited! ? AppColors.pinkColor : AppColors.fontColor,
        ),
      ),
    );
  }
}
