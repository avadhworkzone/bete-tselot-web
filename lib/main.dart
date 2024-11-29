import 'dart:ui';

import 'package:bete_tselot_web/routs/routs.dart';
import 'package:bete_tselot_web/utils/image_utils.dart';
import 'package:bete_tselot_web/view/mobile/home_screen.dart';
import 'package:bete_tselot_web/view/web/web_home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUrlStrategy(PathUrlStrategy());
  await Firebase.initializeApp(options: FirebaseOptions(
    apiKey: 'AIzaSyC9onie-PXAWW4LsmDWqQtbGAgn0MWA4YM',
    appId: '1:559020877410:web:3bd083c404992f94e5d33b',
    messagingSenderId: '559020877410',
    projectId: 'bete-tselot',
    authDomain: 'bete-tselot.firebaseapp.com',
    storageBucket: 'bete-tselot.appspot.com',
    measurementId: 'G-HM8M2NV0TL',
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(builder: (context, constraints) {
      if(constraints.maxWidth>600){
        ///web
        return ScreenUtilInit(
          designSize: const Size(1466, 932),
          child: GetMaterialApp(
            scrollBehavior: MyCustomScrollBehavior(),
            title: 'bete-tselot',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                useMaterial3: true,
                fontFamily: FontUtils.poppins
            ),
            initialRoute: RoutesClass.getHomeRoute(),
            getPages: RoutesClass.routes,
            // home:  const WebHomeScreen(),
            // home:  const HoverUnderlineDemo(),
          ),
        );
      }else{
        ///mob
        return ScreenUtilInit(
          designSize: const Size(430, 932),
          child: GetMaterialApp(
            title: 'Bete Tselot',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                useMaterial3: true,
                fontFamily: FontUtils.poppins
            ),
            initialRoute: kIsWeb ? RoutesClass.getHomeRoute() : RoutesClass.getAppHomeRoute(),
            getPages: RoutesClass.routes,
            // home: kIsWeb?WebHomeScreen(): const HomeScreen(),
            // home:  const HoverUnderlineDemo(),
          ),
        );

      }
    }, );
  }
}


class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}