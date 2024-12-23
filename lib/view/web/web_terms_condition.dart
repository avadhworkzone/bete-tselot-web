import 'package:bete_tselot_web/utils/color_utils.dart';
import 'package:bete_tselot_web/utils/image_utils.dart';
import 'package:bete_tselot_web/utils/static_data.dart';
import 'package:bete_tselot_web/view/web/web_footer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';


class WebTermsConditionScreen extends StatefulWidget {
  const WebTermsConditionScreen({super.key});

  @override
  State<WebTermsConditionScreen> createState() => _WebTermsConditionScreenState();
}

class _WebTermsConditionScreenState extends State<WebTermsConditionScreen> {
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


            ///Footer
            const WebFooter()
          ],
        ),
      ),
    );
  }


  Padding webTopView() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 80.w, vertical: 50.w),
      child:  HtmlWidget(TermsAndCondition.termsAndCondition,
          textStyle: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              fontFamily: FontUtils.poppins),
          onLoadingBuilder: (context, element, loadingProgress) {
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }


}
