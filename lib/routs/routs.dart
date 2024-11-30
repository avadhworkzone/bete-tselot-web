// import 'package:bete_tselot_web/view/mobile/home_screen.dart';
// import 'package:bete_tselot_web/view/web/web_contact_us.dart';
// import 'package:bete_tselot_web/view/web/web_home_screen.dart';
// import 'package:get/get.dart';
// class RoutesClass{
//   static String home="/";
//   static String appHome="/appHome";
//   static String contactUs="/contact";
//
//   static String getHomeRoute()=>home;
//   static String getAppHomeRoute()=>appHome;
//   static String getContactUsRoute()=>contactUs;
//
//   static List<GetPage> routes = [
// GetPage(name: home, page: ()=>const WebHomeScreen()),
// GetPage(name: appHome, page: ()=>const HomeScreen()),
// GetPage(name: contactUs, page: ()=>const WebContactUsScreen())
//   ];
// }

import 'package:bete_tselot_web/view/mobile/home_screen.dart';
import 'package:bete_tselot_web/view/web/web_contact_us.dart';
import 'package:bete_tselot_web/view/web/web_home_screen.dart';
import 'package:bete_tselot_web/view/web/web_privacy_policy.dart';
import 'package:bete_tselot_web/view/web/web_top_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

class RouterClass{

    static String home="/home";
  static String appHome="/appHome";
  static String contactUs="/contact";
  static String privacy="/privacy";

  static String getHomeRoute()=>home;
  static String getAppHomeRoute()=>appHome;
  static String getContactUsRoute()=>contactUs;
  static String getPrivacyRoute()=>privacy;
  static final GoRouter webRouter = GoRouter(
    initialLocation: getHomeRoute(),
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return WebTopBar(isFromContact: false,isFromHome: false,child: child,);
        },
        routes: [
          GoRoute(
            path: getHomeRoute(),
            pageBuilder: (context, state) => const NoTransitionPage(
              child: WebHomeScreen(),
            ),
          ),

          GoRoute(
            path: getContactUsRoute(),
            pageBuilder: (context, state) => const NoTransitionPage(
              child: WebContactUsScreen(),
            ),
          ),
          GoRoute(
            path: getPrivacyRoute(),
            pageBuilder: (context, state) => const NoTransitionPage(
              child: WebPrivacyPolicyScreen(),
            ),
          ),
        ],
      ),
    ],
  );

  static final GoRouter appRouter = GoRouter(
    initialLocation: kIsWeb ? getHomeRoute() : getAppHomeRoute(),
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return WebTopBar(child: child,isFromContact: false,isFromHome: false,);
        },
        routes: [
          GoRoute(
            path: getHomeRoute(),
            pageBuilder: (context, state) => const NoTransitionPage(
              child: WebHomeScreen(),
            ),
          ),
          GoRoute(
            path: getAppHomeRoute(),
            pageBuilder: (context, state) => const NoTransitionPage(
              child: HomeScreen(),
            ),
          ),
          GoRoute(
            path: getContactUsRoute(),
            pageBuilder: (context, state) => const NoTransitionPage(
              child: WebContactUsScreen(),
            ),
          ),

        ],
      ),
    ],
  );
}
