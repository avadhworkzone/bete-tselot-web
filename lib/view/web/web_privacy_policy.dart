import 'package:bete_tselot_web/utils/color_utils.dart';
import 'package:bete_tselot_web/utils/custom_text.dart';
import 'package:bete_tselot_web/utils/image_utils.dart';
import 'package:bete_tselot_web/utils/static_data.dart';
import 'package:bete_tselot_web/utils/string_utils.dart';
import 'package:bete_tselot_web/view/web/web_footer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xfff5f5f5),
                ),
                child:  webTopView()),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 100.w),
              child: Column(
                children: [
                  SizedBox(height: 15.w,),
                  const Divider(thickness: 0.5,),
                  commonPrivacyTab(context: context,title: StringUtils.inSummary,description: PrivacyPolicy.inSummary),
                  const Divider(thickness: 0.5,),
                  commonPrivacyTab(context: context,title: StringUtils.whatThisPrivacyPolicyCovers,description: PrivacyPolicy.privacyPolicyCovers),
                  const Divider(thickness: 0.5,),
                  commonPrivacyTab(context: context,title: StringUtils.categoriesOfPersonalDataWeCollect,description: PrivacyPolicy.personalDataWeCollect),
                  const Divider(thickness: 0.5,),
                  commonPrivacyTab(context: context,title: StringUtils.ourCommercialOrBusinessPurposes,description: PrivacyPolicy.businessPurposeForCollectingPersonalData),
                  const Divider(thickness: 0.5,),
                  commonPrivacyTab(context: context,title: StringUtils.categoriesOfSourcesOfPersonalData,description: PrivacyPolicy.categoriesOfSourcesOfPersonalData),
                  const Divider(thickness: 0.5,),
                  commonPrivacyTab(context: context,title: StringUtils.dataSharing,description: PrivacyPolicy.dataSharing),
                  const Divider(thickness: 0.5,),
                  commonPrivacyTab(context: context,title: StringUtils.dataSecurityRetention,description: PrivacyPolicy.dataSecurityAndRetention),
                  const Divider(thickness: 0.5,),
                  commonPrivacyTab(context: context,title: StringUtils.personalSataOfChildren,description: PrivacyPolicy.personalDataOfChildren),
                  const Divider(thickness: 0.5,),
                  commonPrivacyTab(context: context,title: StringUtils.europeanUnionDataSubjectRights,description: PrivacyPolicy.europeanUnionDataSubjectRights),
                  const Divider(thickness: 0.5,),
                  commonPrivacyTab(context: context,title: StringUtils.brazilResidentsRights,description: PrivacyPolicy.brazilResidentsRights),
                  const Divider(thickness: 0.5,),
                  commonPrivacyTab(context: context,title: StringUtils.californiaResidentsRights,description: PrivacyPolicy.californiaResidentsRights),
                  const Divider(thickness: 0.5,),
                  commonPrivacyTab(context: context,title: StringUtils.otherStateLawPrivacyRights,description: PrivacyPolicy.otherStateLawPrivacyRights),
                  const Divider(thickness: 0.5,),
                  commonPrivacyTab(context: context,title: StringUtils.changeToThisPrivacyPolicy,description: PrivacyPolicy.changeToThisPrivacyPolicy),
                  const Divider(thickness: 0.5,),
                  commonPrivacyTab(context: context,title: StringUtils.contactInformation,description: PrivacyPolicy.contactInformation),
                  const Divider(thickness: 0.5,),
                  commonPrivacyTab(context: context,title: StringUtils.optingOut,description: PrivacyPolicy.optingOut),
                  const Divider(thickness: 0.5,),
                  commonPrivacyTab(context: context,title: StringUtils.termsOfService,description:PrivacyPolicy.termsOfService),
                ],
              ),
            ),

            ///Footer
            const WebFooter()

          ],
        ),
      )
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
      padding: EdgeInsets.only(top: 100.w, bottom: 100.w, left: 140.w,right: 80.w),
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
                  StringUtils.privacyPolicy,
                  fontSize: 28.sp,
                  fontWeight: FontWeight.bold,
                  color: ColorUtils.black29,
                ),
                SizedBox(
                  height: 20.w,
                ),
                CustomText(
                    StringUtils.atBeteTselot,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.normal,
                    color: ColorUtils.black29),
                SizedBox(
                  height: 10.w,
                ),
                CustomText(
                    StringUtils.thisPrivacyPolicyOutlines,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.normal,
                    color: ColorUtils.black29),
                SizedBox(
                  height: 10.w,
                ),
                CustomText(
                    StringUtils.wePublishedThisPrivacyPolicy,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.normal,
                    color: ColorUtils.black29),
                SizedBox(
                  height: 15.w,
                ),
                CustomText(
                  StringUtils.published,
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
    );
  }

}
