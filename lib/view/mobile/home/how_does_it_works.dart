import 'package:bete_tselot_web/CommonWidgets/common_assets.dart';
import 'package:bete_tselot_web/utils/color_utils.dart';
import 'package:bete_tselot_web/utils/custom_text.dart';
import 'package:bete_tselot_web/utils/image_utils.dart';
import 'package:bete_tselot_web/utils/string_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppHowDoesItWork extends StatelessWidget {
  const AppHowDoesItWork({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 60.h,
        ),
        CustomText(
          StringUtils.howDoesItWork,
          fontSize: 18.sp,
          letterSpacing: 1.5,
          fontWeight: FontWeight.bold,
          color: ColorUtils.grey99,
        ),
        SizedBox(
          height: 25.h,
        ),
        CustomText(
          StringUtils.createYourDailyWorshipHabit,
          fontSize: 30.sp,
          fontWeight: FontWeight.bold,
          color: ColorUtils.black29,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 25.h,
        ),
        CustomText(
          StringUtils.growYourFaith,
          fontSize: 16.sp,
          fontWeight: FontWeight.normal,
          color: ColorUtils.black29,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 40.h,
        ),
        LocalAssets(
          imagePath: AssetUtils.prayerImg,
          height: 200.w,
          boxFit: BoxFit.fill,
        ),
        SizedBox(
          height: 10.h,
        ),
        CustomText(
          StringUtils.prayer,
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          color: ColorUtils.black29,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 10.h,
        ),
        CustomText(
          StringUtils.connectWithGodAndYourCommunity,
          fontSize: 16.sp,
          fontWeight: FontWeight.normal,
          color: ColorUtils.grey99,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 50.h,
        ),
      ],
    );
  }
}
