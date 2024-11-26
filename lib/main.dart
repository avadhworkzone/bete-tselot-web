import 'package:bete_tselot_web/utils/image_utils.dart';
import 'package:bete_tselot_web/view/demo.dart';
import 'package:bete_tselot_web/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'view/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1997, 1200),
      child: GetMaterialApp(
        title: 'bete-tselot',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          fontFamily: FontUtils.poppins
        ),
        home:  const HomeScreen(),
        // home:  const HoverUnderlineDemo(),
      ),
    );
  }
}