import 'package:bete_tselot_web/CommonWidgets/common_assets.dart';
import 'package:bete_tselot_web/CommonWidgets/hover_button.dart';
import 'package:bete_tselot_web/CommonWidgets/mouse_region_underline.dart';
import 'package:bete_tselot_web/utils/color_utils.dart';
import 'package:bete_tselot_web/utils/custom_text.dart';
import 'package:bete_tselot_web/utils/image_utils.dart';
import 'package:bete_tselot_web/utils/string_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WebHomeScreen extends StatefulWidget {
  const WebHomeScreen({super.key});

  @override
  State<WebHomeScreen> createState() => _WebHomeScreenState();
}

class _WebHomeScreenState extends State<WebHomeScreen> {
  bool isTapOnHome = true;
  bool isTapOnContact = false;
  List<Map<String, dynamic>> createYourDailyWorkShipList = [
    {
      "title": 'DAILY PASSAGE',
      "value": "Learn God's Word with today's Bible verse",
      "icon": "assets/images/bookIcon.jpg"
    },
    {
      "title": 'DAILY DEVOTIONAL',
      "value": "Grow closer to God with curated devotionals",
      "icon": "assets/images/chatIcon.jpg"
    },
    {
      "title": 'DAILY REFLECTION',
      "value": "Find peace with guided Christian meditations",
      "icon": "assets/images/headphoneIcon.jpg"
    },
    {
      "title": 'PRAYER',
      "value": "Connect with God and your community through prayer",
      "icon": "assets/images/handIcon.jpg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.whiteColor,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              ///top bar
              topBar(),

              ///bottom View
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      topDescription(constraints),
                      ///how does it work
                      secondDescription(constraints),
                      Padding(
                        padding: const EdgeInsets.all(40),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xfff5f5f5),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    offset: const Offset(0, 10),
                                    blurRadius: 10)
                              ]),
                          child:constraints.maxWidth<600? bibileView():bibileRowView(),

                        ),
                      ),
                      constraints.maxWidth<600?appFeatureView():appFeatureRowView()
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Padding bibileView() {
    return Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              LocalAssets(
                                  imagePath: 'assets/images/bibleWeb.png',
                                  height: 500.w),
                              SizedBox(height: 50.h,),
                              Column(
                                children: [
                                  LocalAssets(
                                      imagePath:
                                          'assets/images/image-bible.png',
                                      height: 100.w),
                                  SizedBox(
                                    height: 50.h,
                                  ),
                                  CustomText(
                                    'Bible & Journaling',
                                    fontSize: 20.sp,
                                    letterSpacing: 1.5,
                                    fontWeight: FontWeight.bold,
                                    color: ColorUtils.black29,
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  SizedBox(
                                      width: 300.w,
                                      child: Center(
                                          child: CustomText(
                                        'Access your Bible anywhere, anytime. Highlight favorite verses, add them to your journal, and share with others.',
                                        textAlign: TextAlign.center,
                                        fontSize: 16.sp,
                                        letterSpacing: 1.5,
                                        fontWeight: FontWeight.w400,
                                        color: ColorUtils.black29,
                                      ))),
                                ],
                              ),
                            ],
                          ),
                        );
  }
  Padding bibileRowView() {
    return Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              LocalAssets(
                                  imagePath: 'assets/images/bibleWeb.png',
                                  height: 500.w),
                              Column(
                                children: [
                                  LocalAssets(
                                      imagePath:
                                          'assets/images/image-bible.png',
                                      height: 100.w),
                                  SizedBox(
                                    height: 50.h,
                                  ),
                                  CustomText(
                                    'Bible & Journaling',
                                    fontSize: 20.sp,
                                    letterSpacing: 1.5,
                                    fontWeight: FontWeight.bold,
                                    color: ColorUtils.black29,
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  SizedBox(
                                      width: 300.w,
                                      child: Center(
                                          child: CustomText(
                                        'Access your Bible anywhere, anytime. Highlight favorite verses, add them to your journal, and share with others.',
                                        textAlign: TextAlign.center,
                                        fontSize: 16.sp,
                                        letterSpacing: 1.5,
                                        fontWeight: FontWeight.w400,
                                        color: ColorUtils.black29,
                                      ))),
                                ],
                              ),
                            ],
                          ),
                        );
  }
  Widget appFeatureRowView() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            children: [
              LocalAssets(
                  imagePath: 'assets/images/frature.png',
                  height: 100.w),
              SizedBox(
                height: 50.h,
              ),
              CustomText(
                'Our App Features',
                fontSize: 24.sp,
                letterSpacing: 1.5,
                fontWeight: FontWeight.bold,
                color: ColorUtils.grey99,
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [



              CustomText(
                                                  '1. Prayer in 5 Languages',
                textAlign: TextAlign.center,
                fontSize: 16.sp,
                letterSpacing: 1.5,
                fontWeight: FontWeight.w400,
                color: ColorUtils.blackColor,
                                                ),
              SizedBox(
                height: 20.h,
              ),CustomText(
                                                  '2. The Orthodox Bible',
                                                  textAlign: TextAlign.center,
                                                  fontSize: 16.sp,
                                                  letterSpacing: 1.5,
                                                  fontWeight: FontWeight.w400,
                                                  color: ColorUtils.blackColor,
                                                ),SizedBox(
                height: 20.h,
              ),CustomText(
                                                  '3. Diverse Religious audios',
                                                  textAlign: TextAlign.center,
                                                  fontSize: 16.sp,
                                                  letterSpacing: 1.5,
                                                  fontWeight: FontWeight.w400,
                                                  color: ColorUtils.blackColor,
                                                ),SizedBox(
                height: 20.h,
              ),CustomText(
                                                  '4. Customised reminders',
                                                  textAlign: TextAlign.center,
                                                  fontSize: 16.sp,
                                                  letterSpacing: 1.5,
                                                  fontWeight: FontWeight.w400,
                                                  color: ColorUtils.blackColor,
                                                ),SizedBox(
                height: 20.h,
              ),CustomText(
                                                  'Much More....',
                                                  textAlign: TextAlign.center,
                                                  fontSize: 16.sp,
                                                  letterSpacing: 1.5,
                                                  fontWeight: FontWeight.bold,
                                                  color: ColorUtils.blackColor,
                                                ),

            ],
          ),
        ),
      ],
    );
  }
  Widget appFeatureView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            LocalAssets(
                imagePath: 'assets/images/frature.png',
                height: 100.w),
            SizedBox(
              height: 50.h,
            ),
            CustomText(
              'Our App Features',
              fontSize: 24.sp,
              letterSpacing: 1.5,
              fontWeight: FontWeight.bold,
              color: ColorUtils.grey99,
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [



            CustomText(
                                                '1. Prayer in 5 Languages',
              textAlign: TextAlign.center,
              fontSize: 16.sp,
              letterSpacing: 1.5,
              fontWeight: FontWeight.w400,
              color: ColorUtils.blackColor,
                                              ),
            SizedBox(
              height: 20.h,
            ),CustomText(
                                                '2. The Orthodox Bible',
                                                textAlign: TextAlign.center,
                                                fontSize: 16.sp,
                                                letterSpacing: 1.5,
                                                fontWeight: FontWeight.w400,
                                                color: ColorUtils.blackColor,
                                              ),SizedBox(
              height: 20.h,
            ),CustomText(
                                                '3. Diverse Religious audios',
                                                textAlign: TextAlign.center,
                                                fontSize: 16.sp,
                                                letterSpacing: 1.5,
                                                fontWeight: FontWeight.w400,
                                                color: ColorUtils.blackColor,
                                              ),SizedBox(
              height: 20.h,
            ),CustomText(
                                                '4. Customised reminders',
                                                textAlign: TextAlign.center,
                                                fontSize: 16.sp,
                                                letterSpacing: 1.5,
                                                fontWeight: FontWeight.w400,
                                                color: ColorUtils.blackColor,
                                              ),SizedBox(
              height: 20.h,
            ),CustomText(
                                                'Much More....',
                                                textAlign: TextAlign.center,
                                                fontSize: 16.sp,
                                                letterSpacing: 1.5,
                                                fontWeight: FontWeight.bold,
                                                color: ColorUtils.blackColor,
                                              ),

          ],
        ),
      ],
    );
  }

  Column secondDescription(BoxConstraints constraints) {
    return Column(
      children: [
        howDoesItWorks(),
         constraints.maxWidth>600?
           prayerList():prayerListColumn(),
      ],
    );
  }

  Row prayerList() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          createYourDailyWorkShipList.length,
          (index) => Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: ColorUtils.grey2a.withOpacity(0.2),
                          offset: Offset(0, 10),
                          blurRadius: 10)
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomText(
                        createYourDailyWorkShipList[index]['title'],
                        fontSize: 18.sp,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.bold,
                        color: ColorUtils.grey99,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Image.asset(
                        createYourDailyWorkShipList[index]['icon'],
                        height: 75.w,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomText(
                        createYourDailyWorkShipList[index]['value'],
                        textAlign: TextAlign.center,
                        fontSize: 16.sp,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.w400,
                        color: ColorUtils.black29,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
  }
  Column prayerListColumn() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          createYourDailyWorkShipList.length,
          (index) => Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: ColorUtils.grey2a.withOpacity(0.2),
                        offset: Offset(0, 10),
                        blurRadius: 10)
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomText(
                      createYourDailyWorkShipList[index]['title'],
                      fontSize: 18.sp,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.bold,
                      color: ColorUtils.grey99,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Image.asset(
                      createYourDailyWorkShipList[index]['icon'],
                      height: 75.w,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomText(
                      createYourDailyWorkShipList[index]['value'],
                      textAlign: TextAlign.center,
                      fontSize: 16.sp,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w400,
                      color: ColorUtils.black29,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
  }

  Padding topBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: Row(
        children: [
          Center(
            child: LocalAssets(
              imagePath: AssetUtils.appLogo,
              height: 30.w,
              width: 60.w,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 20.w,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isTapOnContact = false;
                isTapOnHome = true;
              });
            },
            child: HoverUnderlineText(
              text: StringUtils.home,
              style: TextStyle(
                fontSize: 10.sp,
                letterSpacing: 1.5,
                fontWeight: FontWeight.bold,
                fontFamily: FontUtils.poppins,
                color: isTapOnHome == true
                    ? ColorUtils.primaryColor
                    : ColorUtils.black29,
              ),
            ),
          ),
          SizedBox(
            width: 20.w,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isTapOnHome = false;
                isTapOnContact = true;
              });
            },
            child: HoverUnderlineText(
              text: StringUtils.contact,
              style: TextStyle(
                fontSize: 10.sp,
                letterSpacing: 1.5,
                fontFamily: FontUtils.poppins,
                fontWeight: FontWeight.bold,
                color: isTapOnContact == true
                    ? ColorUtils.primaryColor
                    : ColorUtils.black29,
              ),
            ),
          ),
          SizedBox(
            width: 20.w,
          ),

          CustomHoverButton(
            text: StringUtils.downloadNow,
            onPressed: () {
              print('Button Pressed!');
            },
          )
        ],
      ),
    );
  }

  Container topDescription(BoxConstraints constraints) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AssetUtils.cloudImage), fit: BoxFit.cover)),
      child: constraints.maxWidth > 675
          ? Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Row(
                  children: [
                    Expanded(child: topDescriptionView()),
                    Expanded(
                        child: LocalAssets(
                            imagePath: AssetUtils.homeSS, height: 420.w)),
                  ],
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  topDescriptionView(),
                  LocalAssets(
                    imagePath: AssetUtils.homeSS,
                    height: 420.w,
                  ),
                ],
              ),
            ),
    );
  }

  Column howDoesItWorks() {
    return Column(
      children: [
        SizedBox(
          height: 60.h,
        ),
        CustomText(
          StringUtils.howDoesItWork,
          fontSize: 18.sp,
          letterSpacing: 1.5,
          fontWeight: FontWeight.bold,
          color: ColorUtils.grey99,
        ),
        SizedBox(
          height: 25.h,
        ),
        CustomText(
          StringUtils.createYourDailyWorshipHabit,
          fontSize: 30.sp,
          fontWeight: FontWeight.bold,
          color: ColorUtils.black29,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 25.h,
        ),
        CustomText(
          StringUtils.growYourFaith,
          fontSize: 16.sp,
          fontWeight: FontWeight.normal,
          color: ColorUtils.black29,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 40.h,
        ),
        LocalAssets(
          imagePath: AssetUtils.prayerImg,
          height: 200.w,
          boxFit: BoxFit.fill,
        ),
        SizedBox(
          height: 10.h,
        ),
        CustomText(
          StringUtils.prayer,
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          color: ColorUtils.black29,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 10.h,
        ),
        CustomText(
          StringUtils.connectWithGodAndYourCommunity,
          fontSize: 16.sp,
          fontWeight: FontWeight.normal,
          color: ColorUtils.grey99,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 50.h,
        ),
      ],
    );
  }

  Widget topDescriptionView() {
    return Column(
      children: [
        SizedBox(
          height: 25.h,
        ),
        CustomText(
          StringUtils.connectWithGod,
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
          color: ColorUtils.black29,
        ),
        SizedBox(
          height: 25.h,
        ),
        CustomText(StringUtils.dailyWorshipApp,
            fontSize: 18.sp,
            fontWeight: FontWeight.normal,
            color: ColorUtils.black29),
        SizedBox(
          height: 25.h,
        ),
        CustomText(
          StringUtils.downloadBete,
          fontSize: 20.sp,
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
            LocalAssets(
                          imagePath: AssetUtils.appStore,
                          height: 50.w,
                        ),
            SizedBox(
              width: 20.w,
            ),
            LocalAssets(
                          imagePath: AssetUtils.playStore,
                          height: 50.w,
                        ),
          ],
        ),
      ],
    );
  }
}
