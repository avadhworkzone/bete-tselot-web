import 'package:bete_tselot_web/CommonWidgets/common_assets.dart';
import 'package:bete_tselot_web/CommonWidgets/custom_textfield.dart';
import 'package:bete_tselot_web/CommonWidgets/hover_button.dart';
import 'package:bete_tselot_web/CommonWidgets/mouse_region_underline.dart';
import 'package:bete_tselot_web/utils/color_utils.dart';
import 'package:bete_tselot_web/utils/custom_text.dart';
import 'package:bete_tselot_web/utils/image_utils.dart';
import 'package:bete_tselot_web/utils/static_data.dart';
import 'package:bete_tselot_web/utils/string_utils.dart';
import 'package:bete_tselot_web/view/mobile/app_footer.dart';
import 'package:bete_tselot_web/view/web/web_footer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
                  padding: EdgeInsets.symmetric(horizontal: 100.w),
                  child: Column(
                    children: [
                      SizedBox(height: 15.w,),
                      const Divider(thickness: 0.5,),
                      commonPrivacyTab(context: context,title: "In Summary",description: PrivacyPolicy.inSummary),
                      const Divider(thickness: 0.5,),
                      commonPrivacyTab(context: context,title: "what this privacy policy covers",description: PrivacyPolicy.privacyPolicyCovers),
                      const Divider(thickness: 0.5,),
                      commonPrivacyTab(context: context,title: "categories of personal data we collect",description: PrivacyPolicy.personalDataWeCollect),
                      const Divider(thickness: 0.5,),
                      commonPrivacyTab(context: context,title: "our commercial or business purposes for collecting personal data",description: PrivacyPolicy.businessPurposeForCollectingPersonalData),
                      const Divider(thickness: 0.5,),
                      commonPrivacyTab(context: context,title: "categories of sources of personal data",description: PrivacyPolicy.categoriesOfSourcesOfPersonalData),
                      const Divider(thickness: 0.5,),
                      commonPrivacyTab(context: context,title: "data sharing",description: PrivacyPolicy.dataSharing),
                      const Divider(thickness: 0.5,),
                      commonPrivacyTab(context: context,title: "data security and retention",description: PrivacyPolicy.dataSecurityAndRetention),
                      const Divider(thickness: 0.5,),
                      commonPrivacyTab(context: context,title: "personal data of children",description: PrivacyPolicy.personalDataOfChildren),
                      const Divider(thickness: 0.5,),
                      commonPrivacyTab(context: context,title: "european union data subject rights",description: PrivacyPolicy.europeanUnionDataSubjectRights),
                      const Divider(thickness: 0.5,),
                      commonPrivacyTab(context: context,title: "brazil residents rights",description: PrivacyPolicy.brazilResidentsRights),
                      const Divider(thickness: 0.5,),
                      commonPrivacyTab(context: context,title: "california residents rights",description: PrivacyPolicy.californiaResidentsRights),
                      const Divider(thickness: 0.5,),
                      commonPrivacyTab(context: context,title: "other state law privacy rights",description: PrivacyPolicy.otherStateLawPrivacyRights),
                      const Divider(thickness: 0.5,),
                      commonPrivacyTab(context: context,title: "change to this privacy policy",description: PrivacyPolicy.changeToThisPrivacyPolicy),
                      const Divider(thickness: 0.5,),
                      commonPrivacyTab(context: context,title: "contact information",description: PrivacyPolicy.contactInformation),
                      const Divider(thickness: 0.5,),
                      commonPrivacyTab(context: context,title: "opting out",description: PrivacyPolicy.optingOut),
                      const Divider(thickness: 0.5,),
                      commonPrivacyTab(context: context,title: "terms of service",description:PrivacyPolicy.termsOfService),
                    ],
                  ),
                ),

                ///Footer
                constraints.maxWidth < 600
                    ? const WebFooter()
                    : const AppFooter(),
              ],
            ),
          );
        },
      ),
    );
  }

  Theme commonPrivacyTab({required BuildContext context,required String title, required String description}) {
    return Theme(
      data: Theme.of(context).copyWith(
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        dividerColor: Colors.transparent,
      ),
      child: ExpansionTile(
        title: CustomText(
          title.toUpperCase(),
          fontWeight: FontWeight.bold,
        ),
        childrenPadding: EdgeInsets.symmetric(horizontal: 20.w),
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          HtmlWidget(description,
              textStyle: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: FontUtils.poppins),
              onLoadingBuilder: (context, element, loadingProgress) {
            return const Center(child: CircularProgressIndicator());
          }),
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
