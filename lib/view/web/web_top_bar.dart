import 'package:bete_tselot_web/CommonWidgets/common_assets.dart';
import 'package:bete_tselot_web/CommonWidgets/hover_button.dart';
import 'package:bete_tselot_web/CommonWidgets/mouse_region_underline.dart';
import 'package:bete_tselot_web/routs/routs.dart';
import 'package:bete_tselot_web/utils/color_utils.dart';
import 'package:bete_tselot_web/utils/image_utils.dart';
import 'package:bete_tselot_web/utils/string_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class WebTopBar extends StatefulWidget {
  final bool isFromHome;
  final bool isFromContact;
  const WebTopBar({super.key, required this.isFromHome, required this.isFromContact});


  @override
  State<WebTopBar> createState() => _WebTopBarState();
}

class _WebTopBarState extends State<WebTopBar> {
  @override
  Widget build(BuildContext context) {
     return Padding(
      padding: EdgeInsets.symmetric(horizontal: 100.w, vertical: 10.h),
      child: Row(
        children: [
          Center(
            child: LocalAssets(
              imagePath: AssetUtils.appLogo,
              height: 30.w,
              width: 60.w,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 20.w,
          ),
          GestureDetector(
            onTap: () {
              Get.offAllNamed(RoutesClass.getHomeRoute());
              // setState(() {
              //   isTapOnContact = false;
              //   isTapOnHome = true;
              // });
            },
            child: HoverUnderlineText(
              text: StringUtils.home,
              style: TextStyle(
                fontSize: 10.sp,
                letterSpacing: 1.5,
                fontWeight: FontWeight.bold,
                fontFamily: FontUtils.poppins,
                color: widget.isFromHome == true
                    ? ColorUtils.primaryColor
                    : ColorUtils.black29,
              ),
            ),
          ),
          SizedBox(
            width: 20.w,
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed(RoutesClass.getContactUsRoute());
            },
            child: HoverUnderlineText(
              text: StringUtils.contact,
              style: TextStyle(
                fontSize: 10.sp,
                letterSpacing: 1.5,
                fontFamily: FontUtils.poppins,
                fontWeight: FontWeight.bold,
                color: widget.isFromContact == true
                    ? ColorUtils.primaryColor
                    : ColorUtils.black29,
              ),
            ),
          ),
          SizedBox(
            width: 20.w,
          ),
          CustomHoverButton(
            text: StringUtils.downloadNow,
            onPressed: () {
              print('Button Pressed!');
            },
          )
        ],
      ),
    );
  }
}