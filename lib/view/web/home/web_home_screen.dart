import 'package:bete_tselot_web/utils/color_utils.dart';
import 'package:bete_tselot_web/utils/image_utils.dart';
import 'package:bete_tselot_web/utils/string_utils.dart';
import 'package:bete_tselot_web/view/mobile/home/top_description.dart';
import 'package:bete_tselot_web/view/web/home/common_feature_view.dart';
import 'package:bete_tselot_web/view/web/home/how_does_it_works.dart';
import 'package:bete_tselot_web/view/web/home/review_view.dart';
import 'package:bete_tselot_web/view/web/home/sign_up_view.dart';
import 'package:bete_tselot_web/view/web/home/top_description.dart';
import 'package:bete_tselot_web/view/web/web_footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WebHomeScreen extends StatefulWidget {
  const WebHomeScreen({super.key});

  @override
  State<WebHomeScreen> createState() => _WebHomeScreenState();
}

class _WebHomeScreenState extends State<WebHomeScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
          ///Top Description
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AssetUtils.cloudImage), fit: BoxFit.cover)),
            child: const WebTopDescriptionView()
          ),
            ///how does it work

                const WebHowDoesItWork(),
            ///LANGUAGE
            Padding(
              padding: EdgeInsets.all(25.w),
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
                child:  WebCommonFeatureView(
                        ssImage: AssetUtils.selectLanguageSS,
                        image: AssetUtils.selectLanguage,
                        title: StringUtils.prayerIn5Lang,
                        description:
                            StringUtils.celebratesUnityInSpirituality,
                        isImageOnLeft: true),
              ),
            ),
            ///BIBLE
            WebCommonFeatureView(
                    ssImage: AssetUtils.bibleSS,
                    image: AssetUtils.bible,
                    title: StringUtils.theOrthodoxBible,
                    description:StringUtils.accessYourBible,
                    isImageOnLeft: false),

            ///AUDIO
            Padding(
              padding: EdgeInsets.all(25.w),
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
                child:  WebCommonFeatureView(
                        ssImage: AssetUtils.audioSS,
                        image: AssetUtils.audio,
                        title: StringUtils.diverseReligiousAudios,
                        description: StringUtils.chooseFromADiverse,
                        isImageOnLeft: true),
              ),
            ),

            ///Customized reminders
           WebCommonFeatureView(
                    ssImage: AssetUtils.reminderSS,
                    image: AssetUtils.reminder,
                    title: StringUtils.customizedReminders,
                    description: StringUtils.allowYouToSet,
                    isImageOnLeft: false),
            ///App Review
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xfff5f5f5),
                ),
                child: const WebReviewView()),
             ///Sign Up
            const WebSignUpView(),
            ///Footer
            const WebFooter() ,

          ],
        ),
      ),
    );
  }


















  Container topDescription(BoxConstraints constraints) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AssetUtils.cloudImage), fit: BoxFit.cover)),
      child: constraints.maxWidth > 675
          ? const WebTopDescriptionView()
          : const AppTopDescriptionView(),
    );
  }






}
