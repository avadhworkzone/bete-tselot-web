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

import 'package:bete_tselot_web/responsive_layout.dart';
import 'package:bete_tselot_web/view/mobile/app_privacy_policy.dart';
import 'package:bete_tselot_web/view/mobile/contact_us/app_contact_us.dart';
import 'package:bete_tselot_web/view/mobile/home/home_screen.dart';
import 'package:bete_tselot_web/view/mobile/terms_condition.dart';
import 'package:bete_tselot_web/view/web/contact_us/web_contact_us.dart';
import 'package:bete_tselot_web/view/web/home/web_home_screen.dart';
import 'package:bete_tselot_web/view/web/web_privacy_policy.dart';
import 'package:bete_tselot_web/view/web/web_terms_condition.dart';
import 'package:bete_tselot_web/view/web/web_top_bar.dart';
import 'package:go_router/go_router.dart';

class RouterClass{

    static String home="/home";
  static String appHome="/appHome";
  static String contactUs="/contact";
  static String privacy="/privacy";
  static String termsCondition="/terms-conditions";

  static String getHomeRoute()=>home;
  static String getAppHomeRoute()=>appHome;
  static String getContactUsRoute()=>contactUs;
  static String getPrivacyRoute()=>privacy;
  static String getTermsConditionRoute()=>termsCondition;
  static final GoRouter webRouter = GoRouter(
    initialLocation: getHomeRoute(),
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return WebTopBar(child: child,);
        },
        routes: [
          GoRoute(
            path: getHomeRoute(),
            pageBuilder: (context, state) => const NoTransitionPage(
              child: ResponsiveLayout(mobileBody: HomeScreen(), desktopBody: WebHomeScreen()),
            ),
          ),
          GoRoute(
            path: getContactUsRoute(),
            pageBuilder: (context, state) => const NoTransitionPage(
              child: ResponsiveLayout(mobileBody: AppContactUsScreen(), desktopBody: WebContactUsScreen()),

            ),
          ),
          GoRoute(
            path: getPrivacyRoute(),
            pageBuilder: (context, state) => const NoTransitionPage(
              child: ResponsiveLayout(mobileBody: AppPrivacyPolicyScreen(), desktopBody: WebPrivacyPolicyScreen()),
            ),
          ),
          GoRoute(
            path: getTermsConditionRoute(),
            pageBuilder: (context, state) => const NoTransitionPage(
              child: ResponsiveLayout(mobileBody: AppTermsConditionScreen(), desktopBody: WebTermsConditionScreen()),
            ),
          ),
        ],
      ),
    ],
  );


}
