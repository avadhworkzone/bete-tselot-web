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
import 'package:url_launcher/url_launcher.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        children: [
          SizedBox(height: 30.w,),
          InkWell(onTap: () async {
            final Uri url = Uri.parse(StringUtils.logoLink);
            if (!await launchUrl(url)) {
              throw Exception('Could not launch $url');
            }
          },child: LocalAssets(imagePath: AssetUtils.appLogo,height: 60.w,)),
          SizedBox(height: 60.w,),
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
              context.go(RouterClass.getTermsConditionRoute());
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
          SizedBox(height: 20.w),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: InkWell(
                  onTap: () async {
                    final Uri url = Uri.parse(StringUtils.appStoreLink);
                    if (!await launchUrl(url)) {
                      throw Exception('Could not launch $url');
                    }
                  },
                  child: LocalAssets(
                    imagePath: AssetUtils.appStoreBlack,
                    height: 50.w,
                  ),
                ),
              ),
              SizedBox(
                width: 20.w,
              ),
              Flexible(
                child: InkWell(
                  onTap: () async {
                    final Uri url = Uri.parse(StringUtils.playStoreLink);
                    if (!await launchUrl(url)) {
                      throw Exception('Could not launch $url');
                    }
                  },
                  child: LocalAssets(
                    imagePath: AssetUtils.playStoreBlack,
                    height: 50.w,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 15.w,),
          const Divider(),
          SizedBox(height: 10.w,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: CustomText(StringUtils.copyright,color: ColorUtils.grey99,fontSize: 14.sp,)),
              InkWell(onTap: () async {
                final Uri url = Uri.parse(StringUtils.logoLink);
                if (!await launchUrl(url)) {
                  throw Exception('Could not launch $url');
                }
              },child: LocalAssets(imagePath: AssetUtils.instaIcon,height: 50.w,))
              // Icon(Icons.instag)
            ],
          ),
          SizedBox(height: 10.w,),
        ],
      ),
    );
  }
}
