import 'package:bete_tselot_web/CommonWidgets/common_assets.dart';
import 'package:bete_tselot_web/CommonWidgets/custom_textfield.dart';
import 'package:bete_tselot_web/CommonWidgets/hover_button.dart';
import 'package:bete_tselot_web/CommonWidgets/mouse_region_underline.dart';
import 'package:bete_tselot_web/routs/routs.dart';
import 'package:bete_tselot_web/utils/color_utils.dart';
import 'package:bete_tselot_web/utils/custom_text.dart';
import 'package:bete_tselot_web/utils/image_utils.dart';
import 'package:bete_tselot_web/utils/string_utils.dart';
import 'package:bete_tselot_web/view/web/web_footer.dart';
import 'package:bete_tselot_web/view/web/web_top_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class WebHomeScreen extends StatefulWidget {
  const WebHomeScreen({super.key});

  @override
  State<WebHomeScreen> createState() => _WebHomeScreenState();
}

class _WebHomeScreenState extends State<WebHomeScreen> {

  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.whiteColor,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              ///top bar
              // WebTopBar(isFromContact: false, isFromHome: true,),

              ///bottom View
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      topDescription(constraints),
                      ///how does it work
                      secondDescription(constraints),
                      ///LANGUAGE
                      Padding(
                        padding: EdgeInsets.all(25.w),
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
                          child: constraints.maxWidth < 600
                              ? commonFeatureView(
                                  ssImage: AssetUtils.selectLanguageSS,
                                  image: AssetUtils.selectLanguage,
                                  title: "Prayer in 5 Languages",
                                  description:
                                      "Celebrates unity in spirituality by presenting prayers in Amharic, Ge'ez, Tigrinya, English, and Afaan Oromo. It bridges cultures through faith")
                              : commonFeatureRowView(
                                  ssImage: AssetUtils.selectLanguageSS,
                                  image: AssetUtils.selectLanguage,
                                  title: "Prayer in 5 Languages",
                                  description:
                                      "Celebrates unity in spirituality by presenting prayers in Amharic, Ge'ez, Tigrinya, English, and Afaan Oromo. It bridges cultures through faith",
                                  isImageOnLeft: true),
                        ),
                      ),
                      ///BIBLE
                      constraints.maxWidth < 600
                          ? commonFeatureView(
                              ssImage: AssetUtils.bibleSS,
                              image: AssetUtils.bible,
                              title: "The Orthodox Bible",
                              description:
                                  "Access your Bible anywhere, anytime. Easily share verses with others and stay connected to your faith.")
                          : commonFeatureRowView(
                              ssImage: AssetUtils.bibleSS,
                              image: AssetUtils.bible,
                              title: "The Orthodox Bible",
                              description:
                                  "Access your Bible anywhere, anytime. Easily share verses with others and stay connected to your faith.",
                              isImageOnLeft: false),

                      ///AUDIO
                      Padding(
                        padding: EdgeInsets.all(25.w),
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
                          child: constraints.maxWidth < 600
                              ? commonFeatureView(
                                  ssImage: AssetUtils.audioSS,
                                  image: AssetUtils.audio,
                                  title: "Diverse religious audios",
                                  description:
                                      "Choose from a diverse selection of peaceful meditations, empowering declarations, guided prayers, worship music and kid’s stories.")
                              : commonFeatureRowView(
                                  ssImage: AssetUtils.audioSS,
                                  image: AssetUtils.audio,
                                  title: "Diverse religious audios",
                                  description:
                                      "Choose from a diverse selection of peaceful meditations, empowering declarations, guided prayers, worship music and kid’s stories.",
                                  isImageOnLeft: true),
                        ),
                      ),

                      ///Customized reminders
                      constraints.maxWidth < 600
                          ? commonFeatureView(
                              ssImage: AssetUtils.reminderSS,
                              image: AssetUtils.reminder,
                              title: "Customized reminders",
                              description:
                                  "Allow you to set personalized notifications to stay on track with your tasks and goals.")
                          : commonFeatureRowView(
                              ssImage: AssetUtils.reminderSS,
                              image: AssetUtils.reminder,
                              title: "Customized reminders",
                              description:
                                  "Allow you to set personalized notifications to stay on track with your tasks and goals.",
                              isImageOnLeft: false),
                      ///App Review
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xfff5f5f5),
                          ),
                          child: constraints.maxWidth < 600
                              ? appReviewView()
                              : webReviewView()),
                       ///Sign Up
                      constraints.maxWidth < 600 ? appSignUpView() : webSignUpView(),
                      ///Footer
                      constraints.maxWidth < 600 ? const WebFooter() : const WebFooter(),

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

  Padding webSignUpView() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 60.w, vertical: 50.w),
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
          child: Padding(
            padding: EdgeInsets.all(50.w),
            child: Column(
              children: [
                CustomText(
                  "Sign up to receive latest product\nnews, exclusive content & more!",
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: ColorUtils.black29,
                ),
                SizedBox(
                  height: 20.w,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       Expanded(
                          child: CommonTextField(
                            textEditController: firstnameController,
                        hintText: "First Name",
                      )),
                      SizedBox(
                        width: 20.w,
                      ),
                       Expanded(
                          child: CommonTextField(
                            textEditController: lastnameController,
                        hintText: "Last Name",
                      )),
                      SizedBox(
                        width: 20.w,
                      ),
                       Expanded(
                          child: CommonTextField(
                            textEditController: emailController,
                        hintText: "E-mail address",
                      )),

                      // Signup Button
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.w,
                ),
                CustomHoverButton(
                  text: StringUtils.signUp,
                  color: Colors.blue.shade700.withOpacity(0.7),
                  hoverColor: Colors.blue.shade700.withOpacity(0.9),
                  padding:
                      EdgeInsets.symmetric(horizontal: 70.w, vertical: 10.w),
                  onPressed: () {
                    if(firstnameController.text.isEmpty || lastnameController.text.isEmpty|| emailController.text.isEmpty){
                      Fluttertoast.showToast(
                          msg: "All Fields are required",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 2,
                          // webBgColor: Colors.red,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          webBgColor: "linear-gradient(to right, #BB352E, #BB352E)",
                          fontSize: 16.0);
                    }else{
                      final firstName = firstnameController.text;
                      final lastName = lastnameController.text;
                      final email = emailController.text;
                      addDataToFirestore(firstName,lastName,email);
                    }
                  },
                )
              ],
            ),
          )),
    );
  }

  void addDataToFirestore(String firstName, String lastName,String email) async {
    try {
      await FirebaseFirestore.instance.collection('users').add({
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'createdAt': FieldValue.serverTimestamp(),
      });
      firstnameController.clear();
      lastnameController.clear();
      emailController.clear();
      Fluttertoast.showToast(
          msg: "Thank you for Sign Up",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } catch (e) {
      firstnameController.clear();
      lastnameController.clear();
      emailController.clear();
      Fluttertoast.showToast(
          msg: "Something went Wrong",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 2,
          // webBgColor: Colors.red,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          webBgColor: "linear-gradient(to right, #BB352E, #BB352E)",
          fontSize: 16.0);
      print('Error adding data: $e');
    }
  }

  Padding appSignUpView() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 60.w, vertical: 50.w),
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
          child: Padding(
            padding: EdgeInsets.all(50.w),
            child: Column(
              children: [
                CustomText(
                  "Sign up to receive latest product\nnews, exclusive content & more!",
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: ColorUtils.black29,
                ),
                SizedBox(
                  height: 20.w,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          child: CommonTextField(
                            textEditController: firstnameController,
                            hintText: "First Name",
                          )),
                      SizedBox(
                        width: 20.w,
                      ),
                      Expanded(
                          child: CommonTextField(
                            textEditController: lastnameController,
                            hintText: "Last Name",
                          )),
                      SizedBox(
                        width: 20.w,
                      ),
                      Expanded(
                          child: CommonTextField(
                            textEditController: emailController,
                            hintText: "E-mail address",
                          )),

                      // Signup Button
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.w,
                ),
                CustomHoverButton(
                  text: StringUtils.signUp,
                  color: Colors.blue.shade700.withOpacity(0.7),
                  hoverColor: Colors.blue.shade700.withOpacity(0.9),
                  padding:
                  EdgeInsets.symmetric(horizontal: 70.w, vertical: 10.w),
                  onPressed: () {
                    if(firstnameController.text.isEmpty || lastnameController.text.isEmpty|| emailController.text.isEmpty){
                      Fluttertoast.showToast(
                          msg: "All Fields are required",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 2,
                          // webBgColor: Colors.red,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          webBgColor: "linear-gradient(to right, #BB352E, #BB352E)",
                          fontSize: 16.0);
                    }else{
                      final firstName = firstnameController.text;
                      final lastName = lastnameController.text;
                      final email = emailController.text;
                      addDataToFirestore(firstName,lastName,email);
                    }
                  },
                )
              ],
            ),
          )),
    );
  }

  Padding commonFeatureView(
      {required String ssImage,
      required String image,
      required String title,
      required String description}) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LocalAssets(imagePath: ssImage, height: 500.w),
          SizedBox(
            height: 50.h,
          ),
          Column(
            children: [
              LocalAssets(imagePath: image, height: 100.w),
              SizedBox(
                height: 50.h,
              ),
              CustomText(
                title,
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
                    description,
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

  Padding commonFeatureRowView(
      {required String ssImage,
      required String image,
      required String title,
      required String description,
      required bool isImageOnLeft}) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: isImageOnLeft
            ? [
                LocalAssets(imagePath: ssImage, height: 500.w),
                Column(
                  children: [
                    LocalAssets(imagePath: image, height: 120.w),
                    SizedBox(
                      height: 50.h,
                    ),
                    CustomText(
                      title,
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
                          description,
                          textAlign: TextAlign.center,
                          fontSize: 16.sp,
                          letterSpacing: 1.5,
                          fontWeight: FontWeight.w400,
                          color: ColorUtils.black29,
                        ))),
                  ],
                ),
              ]
            : [
                Column(
                  children: [
                    LocalAssets(imagePath: image, height: 120.w),
                    SizedBox(
                      height: 50.h,
                    ),
                    CustomText(
                      title,
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
                          description,
                          textAlign: TextAlign.center,
                          fontSize: 16.sp,
                          letterSpacing: 1.5,
                          fontWeight: FontWeight.w400,
                          color: ColorUtils.black29,
                        ))),
                  ],
                ),
                LocalAssets(imagePath: ssImage, height: 500.w),
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
                  imagePath: 'assets/images/frature.png', height: 100.w),
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
              ),
              CustomText(
                '2. The Orthodox Bible',
                textAlign: TextAlign.center,
                fontSize: 16.sp,
                letterSpacing: 1.5,
                fontWeight: FontWeight.w400,
                color: ColorUtils.blackColor,
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomText(
                '3. Diverse Religious audios',
                textAlign: TextAlign.center,
                fontSize: 16.sp,
                letterSpacing: 1.5,
                fontWeight: FontWeight.w400,
                color: ColorUtils.blackColor,
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomText(
                '4. Customised reminders',
                textAlign: TextAlign.center,
                fontSize: 16.sp,
                letterSpacing: 1.5,
                fontWeight: FontWeight.w400,
                color: ColorUtils.blackColor,
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomText(
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
            LocalAssets(imagePath: 'assets/images/frature.png', height: 100.w),
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
            ),
            CustomText(
              '2. The Orthodox Bible',
              textAlign: TextAlign.center,
              fontSize: 16.sp,
              letterSpacing: 1.5,
              fontWeight: FontWeight.w400,
              color: ColorUtils.blackColor,
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomText(
              '3. Diverse Religious audios',
              textAlign: TextAlign.center,
              fontSize: 16.sp,
              letterSpacing: 1.5,
              fontWeight: FontWeight.w400,
              color: ColorUtils.blackColor,
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomText(
              '4. Customised reminders',
              textAlign: TextAlign.center,
              fontSize: 16.sp,
              letterSpacing: 1.5,
              fontWeight: FontWeight.w400,
              color: ColorUtils.blackColor,
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomText(
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

  final List<Map<String, String>> testimonials = [
    {
      'name': 'Yared M.',
      'stars': '★★★★★',
      'feedback':
          'I am super pleased with this app. I wish there is 10 stars to give. Ethiopian Orthodox Church is lucky to have you guys, I am just speechless for the effort you guys put in. Well done! I am so immersed with the liturgy I felt like I am inside the church. Kibre yegebachehual tsegawn yebzalachu. If people want to give back some please add a support link. I am in for that and will be glad to be the first one.',
    },
    {
      'name': 'Jape Y.',
      'stars': '★★★★★',
      'feedback':
          'I really love this app I dont have words big respect and love for the creater its a nice way to get closer with God and know our religion well',
    },
    {
      'name': 'Bereket A.',
      'stars': '★★★★★',
      'feedback':
          'I\'ve gotten the blessing of the Almighty God through your hard work of this precious app. May God the Almighty bless you & give you more wisdom of Solomon.',
    },
    {
      'name': 'Ab N.',
      'stars': '★★★★★',
      'feedback':
          'This is a great app. I love that it encompasses the daily prayers along with the daily psalms. I would love to see a double tap to add quotes to a favorites tab feature to keep verses we have connected with on that day. God bless you!',
    },
    {
      'name': 'Zekarias G.',
      'stars': '★★★★★',
      'feedback':
          'Thank you for developing the "Bete Tselot" app. It is incredibly helpful and valuable for spiritual growth. The app is easy to use, unlike similar ones, and the language options help many learn prayers in different languages. The simple forms of prayers will aid Christians, especially Orthodox Tewahdo, in their spiritual journey. Please consider breaking down the Holy Bible in the simplest form for daily study to help Christians fall in love with the word of God. Thank you & stay blessed',
    },
    {
      'name': 'Semi K.',
      'stars': '★★★★★',
      'feedback':
          'I am glad that I\'m able to use this app wherever I travel away from home and Orthodox churches. It\'s all in One, Kidase and prayer book. Thank you!',
    },
    {
      'name': 'Eden B.',
      'stars': '★★★★★',
      'feedback':
          'Thank you so much. God bless you. It is an amazing app. I know even foreigners who are exercising to follow the Ethiopian Orthodox Tewahedo religion are using this app and found it really helpful.',
    },
    {
      'name': 'Paula U.',
      'stars': '★★★★★',
      'feedback':
          'I love this app. It\'s so simple and broken down so nicely, I can really focus on the Word. I love the reflection part of the devotional as it helps me to really sync with God. This app has changed my daily routine for the better!',
    },
  ];

  Widget webReviewView() {
    return Padding(
      padding: EdgeInsets.only(top: 50.w),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LocalAssets(
                imagePath: AssetUtils.leftBranch,
                height: 160.w,
              ),
              SizedBox(
                width: 20.w,
              ),
              Column(
                children: [
                  CustomText(
                    'Your REVIEWS',
                    fontSize: 15.sp,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.bold,
                    color: ColorUtils.grey99,
                  ),
                  SizedBox(
                    height: 10.w,
                  ),
                  CustomText(
                    'Trusted by thousands',
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: ColorUtils.black29,
                  ),
                  SizedBox(
                    height: 10.w,
                  ),
                  RichText(
                    text: TextSpan(
                      text: '4.9',
                      style: TextStyle(
                        fontSize: 40.sp,
                        fontWeight: FontWeight.w800,
                        color: ColorUtils.primaryColor,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' out of 5',
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: ColorUtils.greyaa,
                              fontSize: 12.sp),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.w,
                  ),
                  CustomText(
                    '600,000+ ratings. Here are just some of the kind words we\nhave received.',
                    fontSize: 14.sp,
                    textAlign: TextAlign.center,
                    fontFamily: FontUtils.poppins,
                    fontWeight: FontWeight.normal,
                    color: ColorUtils.black77,
                  ),
                ],
              ),
              SizedBox(
                width: 20.w,
              ),
              LocalAssets(
                imagePath: AssetUtils.rightBranch,
                height: 160.w,
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                testimonials.length,
                (index) => SizedBox(
                  width: 350.w,
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: List.generate(
                                    5,
                                    (index) {
                                      return Icon(
                                        Icons.star,
                                        color: ColorUtils.primaryColor,
                                        size: 20.w,
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Expanded(
                                    child: CustomText(
                                  testimonials[index]['name'] ?? "",
                                  fontWeight: FontWeight.bold,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.end,
                                ))
                              ],
                            ),
                            SizedBox(
                              height: 8.w,
                            ),
                            CustomText(
                              testimonials[index]['feedback'] ?? "",
                              fontSize: 12.sp,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          // CarouselSlider(
          //   items:
          //   testimonials.map((testimonial) {
          //     return Container(
          //       padding: const EdgeInsets.all(16),
          //       margin: const EdgeInsets.symmetric(horizontal: 8),
          //       decoration: BoxDecoration(
          //         color: Colors.white,
          //         borderRadius: BorderRadius.circular(12),
          //         boxShadow: [
          //           BoxShadow(
          //             color: Colors.grey.withOpacity(0.5),
          //             spreadRadius: 2,
          //             blurRadius: 5,
          //             offset: const Offset(0, 3),
          //           ),
          //         ],
          //       ),
          //       child: Text(
          //         testimonial,
          //         style: const TextStyle(fontSize: 16),
          //         textAlign: TextAlign.center,
          //       ),
          //     );
          //   }).toList(),
          //   options: CarouselOptions(
          //     // aspectRatio: 16 / 6, // Adjust aspect ratio as needed
          //     viewportFraction: 0.1, // Adjust the visible fraction of items
          //     initialPage: 0,
          //     enableInfiniteScroll: true,
          //     autoPlay: false,
          //     autoPlayInterval: const Duration(seconds: 3),
          //     autoPlayAnimationDuration: const Duration(milliseconds: 800),
          //     autoPlayCurve: Curves.fastOutSlowIn,
          //     enlargeCenterPage: false,
          //     scrollDirection: Axis.horizontal,
          //   ),
          // ),
          //     // CarouselSlider(
          //     //     items: [
          //     //       Container(
          //     //         // width: 250,
          //     //         color: Colors.red,
          //     //         child: Text("hjzghjxbcbxzh bxjkbjkvbj njkxcnjkv nvxjkcbgjkv mnjcxjkv nxjkcv"),
          //     //       )
          //     //     ],
          //     //     options: CarouselOptions(
          //     //       aspectRatio: 16/2,
          //     //       viewportFraction:
          //     //       0.1,
          //     //       initialPage: 0,
          //     //       enableInfiniteScroll: true,
          //     //       reverse: false,
          //     //       autoPlay: false,
          //     //       autoPlayInterval:
          //     //       const Duration(seconds: 3),
          //     //       autoPlayAnimationDuration:
          //     //       const Duration(milliseconds: 800),
          //     //       autoPlayCurve: Curves.fastOutSlowIn,
          //     //       enlargeCenterPage: false,
          //     //       // enlargeFactor: 0.3,
          //     //       onPageChanged: (index, reason) {
          //     //         /*setState(() {
          //     //               _currentIndex = index;
          //     //             });*/
          //     //       },
          //     //       scrollDirection: Axis.horizontal,
          //     //     )),
        ],
      ),
    );
  }

  Widget appReviewView() {
    return Padding(
      padding: EdgeInsets.only(top: 50.w),
      child: Column(
        children: [
          Column(
            children: [
              CustomText(
                'Your REVIEWS',
                fontSize: 15.sp,
                letterSpacing: 1.5,
                fontWeight: FontWeight.bold,
                color: ColorUtils.grey99,
              ),
              SizedBox(
                height: 10.w,
              ),
              CustomText(
                'Trusted by thousands',
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: ColorUtils.black29,
              ),
              SizedBox(
                height: 10.w,
              ),
              RichText(
                text: TextSpan(
                  text: '4.9',
                  style: TextStyle(
                    fontSize: 40.sp,
                    fontWeight: FontWeight.w800,
                    color: ColorUtils.primaryColor,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: ' out of 5',
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: ColorUtils.greyaa,
                          fontSize: 12.sp),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.w,
              ),
              CustomText(
                '600,000+ ratings. Here are just some of the kind words we\nhave received.',
                fontSize: 14.sp,
                textAlign: TextAlign.center,
                fontFamily: FontUtils.poppins,
                fontWeight: FontWeight.normal,
                color: ColorUtils.black77,
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                testimonials.length,
                (index) => SizedBox(
                  width: 350.w,
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: List.generate(
                                    5,
                                    (index) {
                                      return Icon(
                                        Icons.star,
                                        color: ColorUtils.primaryColor,
                                        size: 20.w,
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Expanded(
                                    child: CustomText(
                                  testimonials[index]['name'] ?? "",
                                  fontWeight: FontWeight.bold,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.end,
                                ))
                              ],
                            ),
                            SizedBox(
                              height: 8.w,
                            ),
                            CustomText(
                              testimonials[index]['feedback'] ?? "",
                              fontSize: 12.sp,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          // CarouselSlider(
          //   items:
          //   testimonials.map((testimonial) {
          //     return Container(
          //       padding: const EdgeInsets.all(16),
          //       margin: const EdgeInsets.symmetric(horizontal: 8),
          //       decoration: BoxDecoration(
          //         color: Colors.white,
          //         borderRadius: BorderRadius.circular(12),
          //         boxShadow: [
          //           BoxShadow(
          //             color: Colors.grey.withOpacity(0.5),
          //             spreadRadius: 2,
          //             blurRadius: 5,
          //             offset: const Offset(0, 3),
          //           ),
          //         ],
          //       ),
          //       child: Text(
          //         testimonial,
          //         style: const TextStyle(fontSize: 16),
          //         textAlign: TextAlign.center,
          //       ),
          //     );
          //   }).toList(),
          //   options: CarouselOptions(
          //     // aspectRatio: 16 / 6, // Adjust aspect ratio as needed
          //     viewportFraction: 0.1, // Adjust the visible fraction of items
          //     initialPage: 0,
          //     enableInfiniteScroll: true,
          //     autoPlay: false,
          //     autoPlayInterval: const Duration(seconds: 3),
          //     autoPlayAnimationDuration: const Duration(milliseconds: 800),
          //     autoPlayCurve: Curves.fastOutSlowIn,
          //     enlargeCenterPage: false,
          //     scrollDirection: Axis.horizontal,
          //   ),
          // ),
          //     // CarouselSlider(
          //     //     items: [
          //     //       Container(
          //     //         // width: 250,
          //     //         color: Colors.red,
          //     //         child: Text("hjzghjxbcbxzh bxjkbjkvbj njkxcnjkv nvxjkcbgjkv mnjcxjkv nxjkcv"),
          //     //       )
          //     //     ],
          //     //     options: CarouselOptions(
          //     //       aspectRatio: 16/2,
          //     //       viewportFraction:
          //     //       0.1,
          //     //       initialPage: 0,
          //     //       enableInfiniteScroll: true,
          //     //       reverse: false,
          //     //       autoPlay: false,
          //     //       autoPlayInterval:
          //     //       const Duration(seconds: 3),
          //     //       autoPlayAnimationDuration:
          //     //       const Duration(milliseconds: 800),
          //     //       autoPlayCurve: Curves.fastOutSlowIn,
          //     //       enlargeCenterPage: false,
          //     //       // enlargeFactor: 0.3,
          //     //       onPageChanged: (index, reason) {
          //     //         /*setState(() {
          //     //               _currentIndex = index;
          //     //             });*/
          //     //       },
          //     //       scrollDirection: Axis.horizontal,
          //     //     )),
        ],
      ),
    );
  }

  Column secondDescription(BoxConstraints constraints) {
    return Column(
      children: [
        howDoesItWorks(),
        // constraints.maxWidth>600?
        //   prayerList():prayerListColumn(),
      ],
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
          fontSize: 28.sp,
          fontWeight: FontWeight.bold,
          color: ColorUtils.black29,
        ),
        SizedBox(
          height: 25.h,
        ),
        CustomText(StringUtils.dailyWorshipApp,
            fontSize: 14.sp,
            fontWeight: FontWeight.normal,
            color: ColorUtils.black29),
        SizedBox(
          height: 25.h,
        ),
        CustomText(
          StringUtils.downloadBete,
          fontSize: 16.sp,
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
