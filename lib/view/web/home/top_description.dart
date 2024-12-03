import 'package:bete_tselot_web/CommonWidgets/common_assets.dart';
import 'package:bete_tselot_web/utils/color_utils.dart';
import 'package:bete_tselot_web/utils/custom_text.dart';
import 'package:bete_tselot_web/utils/image_utils.dart';
import 'package:bete_tselot_web/utils/string_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class WebTopDescriptionView extends StatelessWidget {
  const WebTopDescriptionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  SizedBox(
                    height: 25.h,
                  ),
                  CustomText(
                    StringUtils.connectWithGod,
                    fontSize: 28.sp,
                    fontWeight: FontWeight.bold,
                    color: ColorUtils.black29,
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  CustomText(StringUtils.dailyWorshipApp,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.normal,
                      color: ColorUtils.black29),
                  SizedBox(
                    height: 25.h,
                  ),
                  CustomText(
                    StringUtils.downloadBete,
                    fontSize: 16.sp,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.bold,
                    color: ColorUtils.grey99,
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () async {
                          final Uri url = Uri.parse(StringUtils.appStoreLink);
                          if (!await launchUrl(url)) {
                            throw Exception('Could not launch $url');
                          }
                        },
                        child: LocalAssets(
                          imagePath: AssetUtils.appStore,
                          height: 50.w,
                        ),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      InkWell(
                        onTap: () async {
                          final Uri url = Uri.parse(StringUtils.playStoreLink);
                          if (!await launchUrl(url)) {
                            throw Exception('Could not launch $url');
                          }
                        },
                        child: LocalAssets(
                          imagePath: AssetUtils.playStore,
                          height: 50.w,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
                child: LocalAssets(
                    imagePath: AssetUtils.homeSS, height: 420.w)),
          ],
        ),
      ),
    );
  }
}
