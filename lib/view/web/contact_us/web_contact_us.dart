import 'package:bete_tselot_web/utils/color_utils.dart';
import 'package:bete_tselot_web/view/mobile/app_footer.dart';
import 'package:bete_tselot_web/view/mobile/contact_us/contact_us_view.dart';
import 'package:bete_tselot_web/view/web/contact_us/contact_us_view.dart';
import 'package:bete_tselot_web/view/web/web_footer.dart';
import 'package:flutter/material.dart';


class WebContactUsScreen extends StatefulWidget {
  const WebContactUsScreen({super.key});

  @override
  State<WebContactUsScreen> createState() => _WebContactUsScreenState();
}

class _WebContactUsScreenState extends State<WebContactUsScreen> {


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
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xfff5f5f5),
                    ),
                    child: constraints.maxWidth < 600
                        ? const AppContactUsView()
                        : const WebContactUsView()),

                ///Footer
                constraints.maxWidth < 600 ? const WebFooter() : const AppFooter(),
              ],
            ),
          );
        },
      ),
    );
  }







}
