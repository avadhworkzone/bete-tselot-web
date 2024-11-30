import 'package:bete_tselot_web/CommonWidgets/common_assets.dart';
import 'package:bete_tselot_web/CommonWidgets/custom_textfield.dart';
import 'package:bete_tselot_web/CommonWidgets/hover_button.dart';
import 'package:bete_tselot_web/CommonWidgets/mouse_region_underline.dart';
import 'package:bete_tselot_web/utils/color_utils.dart';
import 'package:bete_tselot_web/utils/custom_text.dart';
import 'package:bete_tselot_web/utils/image_utils.dart';
import 'package:bete_tselot_web/utils/static_data.dart';
import 'package:bete_tselot_web/utils/string_utils.dart';
import 'package:bete_tselot_web/view/web/web_footer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:fluttertoast/fluttertoast.dart';

class WebPrivacyPolicyScreen extends StatefulWidget {
  const WebPrivacyPolicyScreen({super.key});

  @override
  State<WebPrivacyPolicyScreen> createState() => _WebPrivacyPolicyScreenState();
}

class _WebPrivacyPolicyScreenState extends State<WebPrivacyPolicyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.whiteColor,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Column(
              children: [
                ///Sign Up
                Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xfff5f5f5),
                    ),
                    child: constraints.maxWidth < 600
                        ? appContactUsView()
                        : webTopView()),

                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 100.w),
                  child: Column(
                    children: [
                      commonPrivacyTab(context),
                    ],
                  ),
                ),


                ///Footer
                constraints.maxWidth < 600
                    ? const WebFooter()
                    : const WebFooter(),
              ],
            ),
          );
        },
      ),
    );
  }

  Theme commonPrivacyTab(BuildContext context) {
    return Theme(
                      data: Theme.of(context).copyWith(
                        hoverColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        dividerColor: Colors.transparent,
                      ),
                      child:  ExpansionTile(
                        title: CustomText('IN SUMMARY',fontWeight: FontWeight.bold,),
                        childrenPadding: EdgeInsets.symmetric(horizontal: 20.w),
                          expandedCrossAxisAlignment : CrossAxisAlignment.start,
                        children: <Widget>[
                          HtmlWidget(
                              PrivacyPolicy.personalDataWeCollect
                              ,
                              textStyle: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: FontUtils.poppins),
                              onLoadingBuilder: (context, element, loadingProgress) {
                                return const Center(
                                    child:CircularProgressIndicator());
                              }),
                //           CustomText("Our key principles are simple:",fontSize: 12.sp),
                //           SizedBox(height: 10,),
                //           Row(
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             children: [
                //
                //               CustomText("• ",),
                //               Expanded(child: CustomText("We do not sell, rent, or otherwise provide users' Personal Data to any data brokers",fontSize: 12.sp,)),
                //             ],
                //           ),
                //           Text('''
                // Our key principles are simple:
                //
                // - We do not sell, rent, or otherwise provide users' Personal Data to any data brokers.
                // - Any App Analytics Data that we do collect – in the spirit of improving or personalizing the product, messaging, and content – is studied only at an aggregate level across the Bete Tselot community (e.g.what content is most popular), unless necessary for fixing specific user issues with the app.
                // - We take care to encrypt all connections ensuring the latest security standards.
                // - We partner with Service Providers (e.g., payment processors, database providers) to support our App and Analytics Partners to study how best to improve our App (e.g., what content is most popular). Personal Data shared with these providers is encrypted and protected.
                // - We do not knowingly collect or solicit the data of anyone under the age of 13 without obtaining COPPA-compliant consent from a parent or guardian, and we do not knowingly share information about individuals under the age of 13 with Advertising Partners.
                //
                // You may, subject to the terms of this Privacy Policy, delete your full account and all data associated with it at any point.
                //
                // NOTE: We published this Privacy Policy on April 29, 2022 and it will take effect on May 13, 2022.
                //
                // TUPOE Ltd and its affiliates, subsidiaries, and related entities ("Bete Tselot", "we, "our") is committed to protecting the privacy and security of the personal data we process about employees and users of our services ("you/your").
                //
                // Bete Tselot refers to the software program provided by TUPOE Ltd and downloaded on any electronic device.
                //               '''),
                        ],
                      ),
                    );
  }

  Padding webTopView() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 80.w, vertical: 50.w),
      child: Padding(
        padding: EdgeInsets.only(top: 50.w, bottom: 50.w, left: 60.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 500.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    "Privacy Policy",
                    fontSize: 28.sp,
                    fontWeight: FontWeight.bold,
                    color: ColorUtils.black29,
                  ),
                  SizedBox(
                    height: 20.w,
                  ),
                  CustomText(
                      "At Bete Tselot, we want to protect your privacy within the app, and minimize how much data we collect.",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.normal,
                      color: ColorUtils.black29),
                  SizedBox(
                    height: 10.w,
                  ),
                  CustomText(
                      "This Privacy Policy outlines how we collect and use your Personal Data, and we encourage you to read it in its entirety.",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.normal,
                      color: ColorUtils.black29),
                  SizedBox(
                    height: 10.w,
                  ),
                  CustomText(
                      "We published this Privacy Policy on April 29, 2022 and it will take effect on May 13, 2022",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.normal,
                      color: ColorUtils.black29),
                  SizedBox(
                    height: 15.w,
                  ),
                  CustomText(
                    "Published: 4/29/2022",
                    fontSize: 16.sp,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.bold,
                    color: ColorUtils.grey99,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding appContactUsView() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 60.w, vertical: 50.w),
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xfff5f5f5),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    offset: const Offset(0, 10),
                    blurRadius: 10)
              ]),
          child: Padding(
            padding: EdgeInsets.all(50.w),
            child: Column(
              children: [
                CustomText(
                  "Sign up to receive latest product\nnews, exclusive content & more!",
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: ColorUtils.black29,
                ),
                SizedBox(
                  height: 20.w,
                ),
              ],
            ),
          )),
    );
  }
}
