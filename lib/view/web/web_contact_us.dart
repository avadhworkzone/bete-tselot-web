import 'package:bete_tselot_web/CommonWidgets/common_assets.dart';
import 'package:bete_tselot_web/CommonWidgets/custom_textfield.dart';
import 'package:bete_tselot_web/CommonWidgets/hover_button.dart';
import 'package:bete_tselot_web/CommonWidgets/mouse_region_underline.dart';
import 'package:bete_tselot_web/routs/routs.dart';
import 'package:bete_tselot_web/utils/color_utils.dart';
import 'package:bete_tselot_web/utils/custom_text.dart';
import 'package:bete_tselot_web/utils/image_utils.dart';
import 'package:bete_tselot_web/utils/string_utils.dart';
import 'package:bete_tselot_web/view/web/web_top_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class WebContactUsScreen extends StatefulWidget {
  const WebContactUsScreen({super.key});

  @override
  State<WebContactUsScreen> createState() => _WebContactUsScreenState();
}

class _WebContactUsScreenState extends State<WebContactUsScreen> {
  TextEditingController firstnameController = TextEditingController();
  TextEditingController messageController = TextEditingController();
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
              const WebTopBar(
                isFromHome: false,
                isFromContact: true,
              ),

              ///bottom View
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ///Sign Up
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xfff5f5f5),
                          ),
                          child: constraints.maxWidth < 600
                              ? appSignUpView()
                              : webSignUpView()),

                      ///Footer
                      constraints.maxWidth < 600 ? webFooter() : webFooter(),
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
      padding: EdgeInsets.symmetric(horizontal: 80.w, vertical: 50.w),
      child: Padding(
        padding: EdgeInsets.all(50.w),
        child: Column(

          children: [
            LocalAssets(imagePath: AssetUtils.contactUs),
            SizedBox(height: 50.w,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        "We'd love to hear from you!",
                        fontSize: 16.sp,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.bold,
                        color: ColorUtils.grey99,
                      ),
                      SizedBox(height: 20.w,),
                      CustomText(
                        "Contact Bete Tselot",
                        fontSize: 28.sp,
                        fontWeight: FontWeight.bold,
                        color: ColorUtils.black29,
                      ),
                      SizedBox(height: 20.w,),
                      CustomText("If you can’t find the answer to your question in our Help Center or you need to get in touch, send us an email or use the contact form and we will get back to you.",
                          fontSize: 14.sp,
                          fontWeight: FontWeight.normal,
                          color: ColorUtils.black29),
                      SizedBox(height: 10.w,),
                      Row(
                        children: [
                          Icon(Icons.email_outlined,color: ColorUtils.grey99.withOpacity(0.6),),
                          SizedBox(width: 5.w,),
                          GestureDetector(
                            onTap: () {},
                            child: HoverUnderlineText(
                              text: "hello@bete-tselot.com",
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                fontFamily: FontUtils.poppins,
                                color: ColorUtils.grey99.withOpacity(0.6),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(width: 50.w,),
                Expanded(
                  child: Column(
                    children: [
                      CommonTextField(
                        textEditController: firstnameController,
                        hintText: "Name",
                      ),
                      SizedBox(height: 10.w,),
                      CommonTextField(
                        textEditController: emailController,
                        hintText: "Email",
                      ),
                      SizedBox(height: 10.w,),
                      CommonTextField(
                        textEditController: messageController,
                        hintText: "Message",
                        maxLine: 3,
                      ),
                      SizedBox(
                        height: 30.w,
                      ),
                      CustomHoverButton(
                        text: StringUtils.submit,
                        color: Colors.blue.shade700.withOpacity(0.7),
                        hoverColor: Colors.blue.shade700.withOpacity(0.9),
                        padding: EdgeInsets.symmetric(
                            horizontal: 70.w, vertical: 10.w),
                        onPressed: () {
                          if (firstnameController.text.isEmpty ||
                              messageController.text.isEmpty ||
                              emailController.text.isEmpty) {
                            Fluttertoast.showToast(
                                msg: "All Fields are required",
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 2,
                                // webBgColor: Colors.red,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                webBgColor:
                                    "linear-gradient(to right, #BB352E, #BB352E)",
                                fontSize: 16.0);
                          } else {
                            final firstName = firstnameController.text;
                            final lastName = messageController.text;
                            final email = emailController.text;
                            addDataToFirestore(firstName, lastName, email);
                          }
                        },
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
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
                        textEditController: messageController,
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
                    if (firstnameController.text.isEmpty ||
                        messageController.text.isEmpty ||
                        emailController.text.isEmpty) {
                      Fluttertoast.showToast(
                          msg: "All Fields are required",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 2,
                          // webBgColor: Colors.red,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          webBgColor:
                              "linear-gradient(to right, #BB352E, #BB352E)",
                          fontSize: 16.0);
                    } else {
                      final firstName = firstnameController.text;
                      final lastName = messageController.text;
                      final email = emailController.text;
                      addDataToFirestore(firstName, lastName, email);
                    }
                  },
                )
              ],
            ),
          )),
    );
  }

  void addDataToFirestore(
      String firstName, String message, String email) async {
    try {
      await FirebaseFirestore.instance.collection('ContactDetail').add({
        'firstName': firstName,
        'email': email,
        'message': message,

        'createdAt': FieldValue.serverTimestamp(),
      });
      firstnameController.clear();
      messageController.clear();
      emailController.clear();
      Fluttertoast.showToast(
          msg: "Thank you for Contact Us",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } catch (e) {
      firstnameController.clear();
      messageController.clear();
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

  Widget webFooter() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 100.w),
      child: Column(
        children: [
          SizedBox(
            height: 50.w,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LocalAssets(
                imagePath: AssetUtils.appLogo,
                height: 60.w,
              ),
              SizedBox(
                width: 60.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: HoverUnderlineText(
                      text: StringUtils.home.toUpperCase(),
                      style: TextStyle(
                        fontSize: 10.sp,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.bold,
                        fontFamily: FontUtils.poppins,
                        color: ColorUtils.black29,
                      ),
                    ),
                  ),
                  SizedBox(height: 15.w),
                  GestureDetector(
                    onTap: () {},
                    child: HoverUnderlineText(
                      text: StringUtils.contact.toUpperCase(),
                      style: TextStyle(
                        fontSize: 10.sp,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.bold,
                        fontFamily: FontUtils.poppins,
                        color: ColorUtils.black29,
                      ),
                    ),
                  ),
                  SizedBox(height: 15.w),
                  GestureDetector(
                    onTap: () {},
                    child: HoverUnderlineText(
                      text: StringUtils.privacyPolicy.toUpperCase(),
                      style: TextStyle(
                        fontSize: 10.sp,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.bold,
                        fontFamily: FontUtils.poppins,
                        color: ColorUtils.black29,
                      ),
                    ),
                  ),
                  SizedBox(height: 15.w),
                  GestureDetector(
                    onTap: () {},
                    child: HoverUnderlineText(
                      text: StringUtils.termsAndCondition.toUpperCase(),
                      style: TextStyle(
                        fontSize: 10.sp,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.bold,
                        fontFamily: FontUtils.poppins,
                        color: ColorUtils.black29,
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LocalAssets(
                    imagePath: AssetUtils.appStoreBlack,
                    height: 50.w,
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  LocalAssets(
                    imagePath: AssetUtils.playStoreBlack,
                    height: 50.w,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 15.w,
          ),
          Divider(),
          SizedBox(
            height: 10.w,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                "Copyright © 2024 Bete Tselot. All Rights Reserved.",
                color: ColorUtils.grey99,
                fontSize: 14.sp,
              ),
              LocalAssets(
                imagePath: AssetUtils.instaIcon,
                height: 50.w,
              )
              // Icon(Icons.instag)
            ],
          ),
          SizedBox(
            height: 10.w,
          ),
        ],
      ),
    );
  }
}