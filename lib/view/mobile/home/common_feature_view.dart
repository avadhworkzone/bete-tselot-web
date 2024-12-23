import 'package:bete_tselot_web/CommonWidgets/common_assets.dart';
import 'package:bete_tselot_web/utils/color_utils.dart';
import 'package:bete_tselot_web/utils/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppCommonFeatureView extends StatelessWidget {
final String ssImage;
  final String image;
  final String title;
  final String description;
  const AppCommonFeatureView({super.key, required this.ssImage, required this.image, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LocalAssets(imagePath: ssImage, height: 500.w),
          SizedBox(
            height: 50.h,
          ),
          Column(
            children: [
              LocalAssets(imagePath: image, height: 100.w),
              SizedBox(
                height: 50.h,
              ),
              CustomText(
                title,
                fontSize: 20.sp,
                letterSpacing: 1.5,
                fontWeight: FontWeight.bold,
                color: ColorUtils.black29,
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                  width: 300.w,
                  child: Center(
                      child: CustomText(
                    description,
                    textAlign: TextAlign.center,
                    fontSize: 16.sp,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.w400,
                    color: ColorUtils.black29,
                  ))),
            ],
          ),
        ],
      ),
    );
  }
}
