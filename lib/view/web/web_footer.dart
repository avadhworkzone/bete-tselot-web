import 'package:bete_tselot_web/CommonWidgets/common_assets.dart';
import 'package:bete_tselot_web/CommonWidgets/mouse_region_underline.dart';
import 'package:bete_tselot_web/routs/routs.dart';
import 'package:bete_tselot_web/utils/color_utils.dart';
import 'package:bete_tselot_web/utils/custom_text.dart';
import 'package:bete_tselot_web/utils/image_utils.dart';
import 'package:bete_tselot_web/utils/string_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class WebFooter extends StatelessWidget {
  const WebFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.symmetric(horizontal: 100.w),
      child: Column(
        children: [
          SizedBox(height: 50.w,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LocalAssets(imagePath: AssetUtils.appLogo,height: 60.w,),
              SizedBox(width: 60.w,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.go(RouterClass.getHomeRoute());
                    },
                    child: HoverUnderlineText(
                      text: StringUtils.home.toUpperCase(),
                      style: TextStyle(
                        fontSize: 10.sp,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.bold,
                        fontFamily: FontUtils.poppins,
                        color: ColorUtils.black29,
                      ),
                    ),
                  ),
                  SizedBox(height: 15.w),
                  GestureDetector(
                    onTap: () {
                      context.go(RouterClass.getContactUsRoute());
                    },
                    child: HoverUnderlineText(
                      text: StringUtils.contact.toUpperCase(),
                      style: TextStyle(
                        fontSize: 10.sp,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.bold,
                        fontFamily: FontUtils.poppins,
                        color: ColorUtils.black29,
                      ),
                    ),
                  ),
                  SizedBox(height: 15.w),
                  GestureDetector(
                    onTap: () {
                      context.go(RouterClass.getPrivacyRoute());
                    },
                    child: HoverUnderlineText(
                      text: StringUtils.privacyPolicy.toUpperCase(),
                      style: TextStyle(
                        fontSize: 10.sp,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.bold,
                        fontFamily: FontUtils.poppins,
                        color: ColorUtils.black29,
                      ),
                    ),
                  ),
                  SizedBox(height: 15.w),
                  GestureDetector(
                    onTap: () {
                    },
                    child: HoverUnderlineText(
                      text: StringUtils.termsAndCondition.toUpperCase(),
                      style: TextStyle(
                        fontSize: 10.sp,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.bold,
                        fontFamily: FontUtils.poppins,
                        color: ColorUtils.black29,
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LocalAssets(
                    imagePath: AssetUtils.appStoreBlack,
                    height: 50.w,
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  LocalAssets(
                    imagePath: AssetUtils.playStoreBlack,
                    height: 50.w,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 15.w,),
          Divider(),
          SizedBox(height: 10.w,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText("Copyright © 2024 Bete Tselot. All Rights Reserved.",color: ColorUtils.grey99,fontSize: 14.sp,),
              LocalAssets(imagePath: AssetUtils.instaIcon,height: 50.w,)
              // Icon(Icons.instag)
            ],
          ),
          SizedBox(height: 10.w,),
        ],
      ),
    );
  }
}
