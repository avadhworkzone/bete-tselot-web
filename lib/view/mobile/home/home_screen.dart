import 'package:bete_tselot_web/utils/color_utils.dart';
import 'package:bete_tselot_web/utils/image_utils.dart';
import 'package:bete_tselot_web/utils/string_utils.dart';
import 'package:bete_tselot_web/view/mobile/app_footer.dart';
import 'package:bete_tselot_web/view/mobile/home/common_feature_view.dart';
import 'package:bete_tselot_web/view/mobile/home/how_does_it_works.dart';
import 'package:bete_tselot_web/view/mobile/home/review_view.dart';
import 'package:bete_tselot_web/view/mobile/home/sign_up_view.dart';
import 'package:bete_tselot_web/view/mobile/home/top_description.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


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
     body: SingleChildScrollView(
       child: Column(
         children: [
           ///Top Description
           Container(
             decoration: BoxDecoration(
                 image: DecorationImage(
                     image: AssetImage(AssetUtils.cloudImage), fit: BoxFit.cover)),
             child: const AppTopDescriptionView()),
             ///how does it work
             const AppHowDoesItWork(),
           ///LANGUAGE
           Padding(
             padding: EdgeInsets.all(25.w),
             child: Container(
                 width: double.infinity,
               decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(10),
                   color: const Color(0xfff5f5f5),
                   boxShadow: [
                     BoxShadow(
                         color: Colors.grey.withOpacity(0.3),
                         offset: const Offset(0, 10),
                         blurRadius: 10)
                   ]),
               child: AppCommonFeatureView(
                   ssImage: AssetUtils.selectLanguageSS,
                   image: AssetUtils.selectLanguage,
                   title: StringUtils.prayerIn5Lang,
                   description:
               StringUtils.celebratesUnityInSpirituality)

             ),
           ),
           ///BIBLE
           AppCommonFeatureView(
               ssImage: AssetUtils.bibleSS,
               image: AssetUtils.bible,
               title: StringUtils.theOrthodoxBible,
               description:
               StringUtils.accessYourBible),
           ///AUDIO
           Padding(
             padding: EdgeInsets.all(25.w),
             child: Container(
               width: double.infinity,
               decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(10),
                   color: const Color(0xfff5f5f5),
                   boxShadow: [
                     BoxShadow(
                         color: Colors.grey.withOpacity(0.3),
                         offset: const Offset(0, 10),
                         blurRadius: 10)
                   ]),
               child: AppCommonFeatureView(
                   ssImage: AssetUtils.audioSS,
                   image: AssetUtils.audio,
                   title: StringUtils.diverseReligiousAudios,
                   description:
                   StringUtils.chooseFromADiverse),

             ),
           ),
           ///Customized reminders
           AppCommonFeatureView(
               ssImage: AssetUtils.reminderSS,
               image: AssetUtils.reminder,
               title: StringUtils.customizedReminders,
               description:
               StringUtils.allowYouToSet),
           ///App Review
           Container(
               width: double.infinity,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(10),
                 color: const Color(0xfff5f5f5),
               ),
               child:  const AppReviewView()
                  ),
           ///Sign Up
           const AppSignUpView() ,
           ///Footer
           const AppFooter(),

         ],
       ),
     ),
    );
  }
}
