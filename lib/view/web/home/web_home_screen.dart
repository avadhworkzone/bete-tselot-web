import 'package:bete_tselot_web/CommonWidgets/common_assets.dart';
import 'package:bete_tselot_web/CommonWidgets/custom_textfield.dart';
import 'package:bete_tselot_web/CommonWidgets/hover_button.dart';
import 'package:bete_tselot_web/utils/color_utils.dart';
import 'package:bete_tselot_web/utils/custom_text.dart';
import 'package:bete_tselot_web/utils/image_utils.dart';
import 'package:bete_tselot_web/utils/static_data.dart';
import 'package:bete_tselot_web/utils/string_utils.dart';
import 'package:bete_tselot_web/view/mobile/app_footer.dart';
import 'package:bete_tselot_web/view/mobile/home/common_feature_view.dart';
import 'package:bete_tselot_web/view/mobile/home/how_does_it_works.dart';
import 'package:bete_tselot_web/view/mobile/home/review_view.dart';
import 'package:bete_tselot_web/view/mobile/home/sign_up_view.dart';
import 'package:bete_tselot_web/view/mobile/home/top_description.dart';
import 'package:bete_tselot_web/view/web/home/common_feature_view.dart';
import 'package:bete_tselot_web/view/web/home/how_does_it_works.dart';
import 'package:bete_tselot_web/view/web/home/review_view.dart';
import 'package:bete_tselot_web/view/web/home/sign_up_view.dart';
import 'package:bete_tselot_web/view/web/home/top_description.dart';
import 'package:bete_tselot_web/view/web/web_footer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              ///bottom View
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                    ///Top Description
                    Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(AssetUtils.cloudImage), fit: BoxFit.cover)),
                      child: constraints.maxWidth > 675
                          ? const WebTopDescriptionView()
                          : const AppTopDescriptionView(),
                    ),
                      ///how does it work
                      constraints.maxWidth>600?
                          const WebHowDoesItWork():const AppHowDoesItWork(),
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
                          child: constraints.maxWidth < 600
                              ? AppCommonFeatureView(
                                  ssImage: AssetUtils.selectLanguageSS,
                                  image: AssetUtils.selectLanguage,
                                  title: "Prayer in 5 Languages",
                                  description:
                                      "Celebrates unity in spirituality by presenting prayers in Amharic, Ge'ez, Tigrinya, English, and Afaan Oromo. It bridges cultures through faith")
                              : WebCommonFeatureView(
                                  ssImage: AssetUtils.selectLanguageSS,
                                  image: AssetUtils.selectLanguage,
                                  title: "Prayer in 5 Languages",
                                  description:
                                      "Celebrates unity in spirituality by presenting prayers in Amharic, Ge'ez, Tigrinya, English, and Afaan Oromo. It bridges cultures through faith",
                                  isImageOnLeft: true),
                        ),
                      ),
                      ///BIBLE
                      constraints.maxWidth < 600
                          ? AppCommonFeatureView(
                              ssImage: AssetUtils.bibleSS,
                              image: AssetUtils.bible,
                              title: "The Orthodox Bible",
                              description:
                                  "Access your Bible anywhere, anytime. Easily share verses with others and stay connected to your faith.")
                          : WebCommonFeatureView(
                              ssImage: AssetUtils.bibleSS,
                              image: AssetUtils.bible,
                              title: "The Orthodox Bible",
                              description:
                                  "Access your Bible anywhere, anytime. Easily share verses with others and stay connected to your faith.",
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
                          child: constraints.maxWidth < 600
                              ? AppCommonFeatureView(
                                  ssImage: AssetUtils.audioSS,
                                  image: AssetUtils.audio,
                                  title: "Diverse religious audios",
                                  description:
                                      "Choose from a diverse selection of peaceful meditations, empowering declarations, guided prayers, worship music and kid’s stories.")
                              : WebCommonFeatureView(
                                  ssImage: AssetUtils.audioSS,
                                  image: AssetUtils.audio,
                                  title: "Diverse religious audios",
                                  description:
                                      "Choose from a diverse selection of peaceful meditations, empowering declarations, guided prayers, worship music and kid’s stories.",
                                  isImageOnLeft: true),
                        ),
                      ),

                      ///Customized reminders
                      constraints.maxWidth < 600
                          ? AppCommonFeatureView(
                              ssImage: AssetUtils.reminderSS,
                              image: AssetUtils.reminder,
                              title: "Customized reminders",
                              description:
                                  "Allow you to set personalized notifications to stay on track with your tasks and goals.")
                          : WebCommonFeatureView(
                              ssImage: AssetUtils.reminderSS,
                              image: AssetUtils.reminder,
                              title: "Customized reminders",
                              description:
                                  "Allow you to set personalized notifications to stay on track with your tasks and goals.",
                              isImageOnLeft: false),
                      ///App Review
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xfff5f5f5),
                          ),
                          child: constraints.maxWidth < 600
                              ? const AppReviewView()
                              : const WebReviewView()),
                       ///Sign Up
                      constraints.maxWidth < 600 ? const AppSignUpView() : const WebSignUpView(),
                      ///Footer
                      constraints.maxWidth > 600 ? const WebFooter() : const AppFooter(),

                    ],
                  ),
                ),
              ),
            ],
          );
        },
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
