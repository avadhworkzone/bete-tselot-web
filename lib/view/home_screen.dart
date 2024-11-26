import 'package:bete_tselot_web/CommonWidgets/common_assets.dart';
import 'package:bete_tselot_web/CommonWidgets/mouse_region_underline.dart';
import 'package:bete_tselot_web/utils/color_utils.dart';
import 'package:bete_tselot_web/utils/custom_text.dart';
import 'package:bete_tselot_web/utils/image_utils.dart';
import 'package:bete_tselot_web/utils/string_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../CommonWidgets/hover_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isTapOnHome = true;
  bool isTapOnContact = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.whiteColor,
     body: Column(
       children: [
         Padding(
           padding:  EdgeInsets.only(top: 20,bottom : 20,left: 10.w,right: 8.w),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               LocalAssets(imagePath: AssetUtils.appLogo,height: 60.w,width: 60.w,),
               Row(
                 children:  [
                   GestureDetector(
                     onTap: (){
                       setState(() {
                         isTapOnContact = false;
                         isTapOnHome = true;
                       });
                     },
                     child: HoverUnderlineText(
                       text: StringUtils.home,
                       style: TextStyle(
                         fontSize: 14.sp,
                         letterSpacing: 1.5,
                         fontWeight: FontWeight.bold,
                         fontFamily: FontUtils.poppins,
                         color: isTapOnHome == true ? ColorUtils.primaryColor : ColorUtils.black29,
                       ),
                     ),
                   ),
                   SizedBox(width: 50.w,),
                   GestureDetector(
                     onTap: (){
                       setState(() {
                         isTapOnHome = false;
                         isTapOnContact = true;
                       });
                     },
                     child: HoverUnderlineText(
                       text: StringUtils.contact,
                       style: TextStyle(
                         fontSize: 14.sp,
                         letterSpacing: 1.5,
                         fontFamily: FontUtils.poppins,
                         fontWeight: FontWeight.bold,
                         color: isTapOnContact == true ? ColorUtils.primaryColor : ColorUtils.black29,
                       ),
                     ),
                   ),
                   SizedBox(width: 50.w,),
                   CustomHoverButton(
                     text: StringUtils.downloadNow,
                     onPressed: () {
                       print('Button Pressed!');
                     },
                   ),
                 ],
               )
             ],
           ),
         ),
         Expanded(
           child: SingleChildScrollView(
             child: Column(
               children: [
                 Stack(
                   children: [
                     LocalAssets(imagePath: AssetUtils.cloudImage,height: 900.h,width: Get.width,boxFit: BoxFit.fill,),
                     Positioned(
                       top: 0,
                       bottom: 0,
                       left: 0,
                       right: 0,
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: [
                           Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               CustomText(StringUtils.connectWithGod,fontSize: 40.sp,fontWeight: FontWeight.bold,color: ColorUtils.black29,),
                               SizedBox(height: 40.h,),
                               CustomText(StringUtils.dailyWorshipApp,fontSize: 20.sp,fontWeight: FontWeight.normal,color: ColorUtils.black29),
                               SizedBox(height: 128.h,),
                               CustomText(StringUtils.downloadBete,fontSize: 22 .sp,letterSpacing : 1.5,fontWeight: FontWeight.bold,color: ColorUtils.grey99,),
                               SizedBox(height: 50.h,),
                               Row(
                                 children: [
                                   LocalAssets(imagePath: AssetUtils.appStore,height: 75.h,width: 200.w,),
                                   SizedBox(width: 10.w,),
                                   LocalAssets(imagePath: AssetUtils.playStore,height: 75.h,width: 200.w,),
                                 ],
                               )
                             ],
                           ),
                           LocalAssets(imagePath: AssetUtils.homeSS,width: 965.w),
                         ],
                       ),
                     )
                   ],
                 ),
               ],
             ),
           ),
         ),
       ],
     ),
    );
  }
}
