// import 'package:bete_tselot_web/CommonWidgets/common_assets.dart';
// import 'package:bete_tselot_web/CommonWidgets/hover_button.dart';
// import 'package:bete_tselot_web/CommonWidgets/mouse_region_underline.dart';
// import 'package:bete_tselot_web/routs/routs.dart';
// import 'package:bete_tselot_web/utils/color_utils.dart';
// import 'package:bete_tselot_web/utils/image_utils.dart';
// import 'package:bete_tselot_web/utils/string_utils.dart';
// import 'package:bete_tselot_web/view/web/web_footer.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:go_router/go_router.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// class WebTopBar extends StatefulWidget {
//   final bool isFromHome;
//   final bool isFromContact;
//   final Widget child;
//   const WebTopBar({super.key, required this.isFromHome, required this.isFromContact, required this.child});
//
//
//   @override
//   State<WebTopBar> createState() => _WebTopBarState();
// }
//
// class _WebTopBarState extends State<WebTopBar> {
//   @override
//   Widget build(BuildContext context) {
//     final String location = GoRouterState.of(context).uri.toString();
//      return Scaffold(
//        backgroundColor: ColorUtils.whiteColor,
//        body: LayoutBuilder(
//          builder: (context, constraints) {
//            return Column(
//              children: [
//                Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 100.w, vertical: 10.h),
//                 child: Row(
//                   children: [
//                     Center(
//                       child: InkWell(
//                         onTap: () async {
//                           final Uri url = Uri.parse('https://bete-tselot.com/');
//                           if (!await launchUrl(url)) {
//                           throw Exception('Could not launch $url');
//                           }
//                         },
//                         child: LocalAssets(
//                           imagePath: AssetUtils.appLogo,
//                           height: 30.w,
//                           width: 60.w,
//                         ),
//                       ),
//                     ),
//                     const Spacer(),
//                     SizedBox(
//                       width: 20.w,
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         context.go(RouterClass.getHomeRoute());
//                       },
//                       child: HoverUnderlineText(
//                         text: StringUtils.home,
//                         style: TextStyle(
//                           fontSize: 10.sp,
//                           letterSpacing: 1.5,
//                           fontWeight: FontWeight.bold,
//                           fontFamily: FontUtils.poppins,
//                           color: location == RouterClass.getHomeRoute()
//                               ? ColorUtils.primaryColor
//                               : ColorUtils.black29,
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       width: 20.w,
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         context.go(RouterClass.getContactUsRoute());
//                       },
//                       child: HoverUnderlineText(
//                         text: StringUtils.contact,
//                         style: TextStyle(
//                           fontSize: 10.sp,
//                           letterSpacing: 1.5,
//                           fontFamily: FontUtils.poppins,
//                           fontWeight: FontWeight.bold,
//                           color: location == RouterClass.getContactUsRoute()
//                               ? ColorUtils.primaryColor
//                               : ColorUtils.black29,
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       width: 20.w,
//                     ),
//                     CustomHoverButton(
//                       text: StringUtils.downloadNow,
//                       onPressed: () async {
//                         final Uri url = Uri.parse('https://play.google.com/store/apps/details?id=com.kiduel.bete_tselot&hl=en&pli=1');
//                         if (!await launchUrl(url)) {
//                         throw Exception('Could not launch $url');
//                         }
//                       },
//                     )
//                   ],
//                 ),
//                    ),
//                Expanded(child: widget.child),
//
//              ],
//            );
//          }
//        ),
//      );
//   }
// }




import 'package:bete_tselot_web/CommonWidgets/common_assets.dart';
import 'package:bete_tselot_web/CommonWidgets/hover_button.dart';
import 'package:bete_tselot_web/CommonWidgets/mouse_region_underline.dart';
import 'package:bete_tselot_web/routs/routs.dart';
import 'package:bete_tselot_web/utils/color_utils.dart';
import 'package:bete_tselot_web/utils/image_utils.dart';
import 'package:bete_tselot_web/utils/string_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class WebTopBar extends StatefulWidget {
  final bool isFromHome;
  final bool isFromContact;
  final Widget child;

  const WebTopBar({
    super.key,
    required this.isFromHome,
    required this.isFromContact,
    required this.child,
  });

  @override
  State<WebTopBar> createState() => _WebTopBarState();
}

class _WebTopBarState extends State<WebTopBar> {
  bool tapOnMenu = false;
  @override
  Widget build(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();

    return Scaffold(
      backgroundColor: ColorUtils.whiteColor,
      body: LayoutBuilder(
        builder: (context, constraints) {
            return Column(
              children: [
                Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: constraints.maxWidth > 600 ? 100.w : 10.w, vertical: 10.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Center(
                        child: InkWell(
                          onTap: () async {
                            final Uri url = Uri.parse('https://bete-tselot.com/');
                            if (!await launchUrl(url)) {
                              throw Exception('Could not launch $url');
                            }
                          },
                          child: LocalAssets(
                            imagePath: AssetUtils.appLogo,
                            height: 30.w,
                            width: 60.w,
                          ),
                        ),
                      ),

                      constraints.maxWidth>600?Row(children: [
                        GestureDetector(
                          onTap: () {
                            context.go(RouterClass.getHomeRoute());
                          },
                          child: HoverUnderlineText(
                            text: StringUtils.home,
                            style: TextStyle(
                              fontSize: 10.sp,
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.bold,
                              fontFamily: FontUtils.poppins,
                              color: location == RouterClass.getHomeRoute()
                                  ? ColorUtils.primaryColor
                                  : ColorUtils.black29,
                            ),
                          ),
                        ),
                        SizedBox(width: 20.w),
                        GestureDetector(
                          onTap: () {
                            context.go(RouterClass.getContactUsRoute());
                          },
                          child: HoverUnderlineText(
                            text: StringUtils.contact,
                            style: TextStyle(
                              fontSize: 10.sp,
                              letterSpacing: 1.5,
                              fontFamily: FontUtils.poppins,
                              fontWeight: FontWeight.bold,
                              color: location == RouterClass.getContactUsRoute()
                                  ? ColorUtils.primaryColor
                                  : ColorUtils.black29,
                            ),
                          ),
                        ),
                        SizedBox(width: 20.w),
                        CustomHoverButton(
                          text: StringUtils.downloadNow,
                          onPressed: () async {
                            final Uri url = Uri.parse(
                                'https://play.google.com/store/apps/details?id=com.kiduel.bete_tselot&hl=en&pli=1');
                            if (!await launchUrl(url)) {
                              throw Exception('Could not launch $url');
                            }
                          },
                        )
                      ],) : IconButton(onPressed: (){
                        setState(() {
                          tapOnMenu = !tapOnMenu;
                        });
                      }, icon: Icon(Icons.menu))
                    ],
                  ),
                ),
                if( constraints.maxWidth < 600 && tapOnMenu == true)
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.go(RouterClass.getHomeRoute());
                      },
                      child: HoverUnderlineText(
                        text: StringUtils.home,
                        style: TextStyle(
                          fontSize: 10.sp,
                          letterSpacing: 1.5,
                          fontWeight: FontWeight.bold,
                          fontFamily: FontUtils.poppins,
                          color: location == RouterClass.getHomeRoute()
                              ? ColorUtils.primaryColor
                              : ColorUtils.black29,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.w),
                    GestureDetector(
                      onTap: () {
                        context.go(RouterClass.getContactUsRoute());
                      },
                      child: HoverUnderlineText(
                        text: StringUtils.contact,
                        style: TextStyle(
                          fontSize: 10.sp,
                          letterSpacing: 1.5,
                          fontFamily: FontUtils.poppins,
                          fontWeight: FontWeight.bold,
                          color: location == RouterClass.getContactUsRoute()
                              ? ColorUtils.primaryColor
                              : ColorUtils.black29,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.w),
                    CustomHoverButton(
                      text: StringUtils.downloadNow,
                      onPressed: () async {
                        final Uri url = Uri.parse(
                            'https://play.google.com/store/apps/details?id=com.kiduel.bete_tselot&hl=en&pli=1');
                        if (!await launchUrl(url)) {
                          throw Exception('Could not launch $url');
                        }
                      },
                    ),
                    SizedBox(height: 20.w),
                  ],
                ),
                Expanded(child: widget.child),
              ],
            );

        },
      ),
    );
  }
}

