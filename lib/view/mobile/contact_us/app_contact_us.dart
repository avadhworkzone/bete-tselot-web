import 'package:bete_tselot_web/utils/color_utils.dart';
import 'package:bete_tselot_web/view/mobile/app_footer.dart';
import 'package:bete_tselot_web/view/mobile/contact_us/contact_us_view.dart';
import 'package:flutter/material.dart';


class AppContactUsScreen extends StatefulWidget {
  const AppContactUsScreen({super.key});

  @override
  State<AppContactUsScreen> createState() => _AppContactUsScreenState();
}

class _AppContactUsScreenState extends State<AppContactUsScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///Sign Up
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xfff5f5f5),
                ),
                child: const AppContactUsView()
                    ),

            ///Footer
             const AppFooter(),
          ],
        ),
      ),
    );
  }







}
