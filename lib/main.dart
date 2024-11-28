import 'package:bete_tselot_web/utils/image_utils.dart';
import 'package:bete_tselot_web/view/mobile/home_screen.dart';
import 'package:bete_tselot_web/view/web/web_home_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(builder: (context, constraints) {
      if(constraints.maxWidth>650){
        ///web
        return ScreenUtilInit(
          designSize: const Size(1466, 932),
          child: GetMaterialApp(
            title: 'bete-tselot',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                useMaterial3: true,
                fontFamily: FontUtils.poppins
            ),
            home:  const WebHomeScreen(),
            // home:  const HoverUnderlineDemo(),
          ),
        );
      }else{
        ///mob
        return ScreenUtilInit(
          designSize: const Size(430, 932),
          child: GetMaterialApp(
            title: 'bete-tselot',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                useMaterial3: true,
                fontFamily: FontUtils.poppins
            ),
            home: kIsWeb?WebHomeScreen(): const HomeScreen(),
            // home:  const HoverUnderlineDemo(),
          ),
        );

      }
    }, );
  }
}