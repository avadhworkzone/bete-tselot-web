import 'package:bete_tselot_web/view/mobile/home_screen.dart';
import 'package:bete_tselot_web/view/web/web_contact_us.dart';
import 'package:bete_tselot_web/view/web/web_home_screen.dart';
import 'package:get/get.dart';
class RoutesClass{
  static String home="/";
  static String appHome="/appHome";
  static String contactUs="/contact";

  static String getHomeRoute()=>home;
  static String getAppHomeRoute()=>appHome;
  static String getContactUsRoute()=>contactUs;

  static List<GetPage> routes = [
GetPage(name: home, page: ()=>const WebHomeScreen()),
GetPage(name: appHome, page: ()=>const HomeScreen()),
GetPage(name: contactUs, page: ()=>const WebContactUsScreen())
  ];
}