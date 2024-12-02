import 'package:bete_tselot_web/utils/color_utils.dart';
import 'package:bete_tselot_web/utils/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../CommonWidgets/common_assets.dart';

class WebCommonFeatureView extends StatelessWidget {
  final String ssImage;
  final String image;
  final String title;
  final String description;
  final bool isImageOnLeft;
  const WebCommonFeatureView({super.key, required this.ssImage, required this.image, required this.title, required this.description, required this.isImageOnLeft});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: isImageOnLeft
            ? [
          LocalAssets(imagePath: ssImage, height: 500.w),
          Column(
            children: [
              LocalAssets(imagePath: image, height: 120.w),
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
        ]
            : [
          Column(
            children: [
              LocalAssets(imagePath: image, height: 120.w),
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
          LocalAssets(imagePath: ssImage, height: 500.w),
        ],
      ),
    );
  }
}
