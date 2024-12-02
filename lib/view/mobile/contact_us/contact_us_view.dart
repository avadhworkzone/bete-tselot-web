import 'package:bete_tselot_web/CommonWidgets/common_assets.dart';
import 'package:bete_tselot_web/CommonWidgets/custom_textfield.dart';
import 'package:bete_tselot_web/CommonWidgets/hover_button.dart';
import 'package:bete_tselot_web/CommonWidgets/mouse_region_underline.dart';
import 'package:bete_tselot_web/utils/color_utils.dart';
import 'package:bete_tselot_web/utils/custom_text.dart';
import 'package:bete_tselot_web/utils/image_utils.dart';
import 'package:bete_tselot_web/utils/string_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class AppContactUsView extends StatefulWidget {

  const AppContactUsView({super.key});

  @override
  State<AppContactUsView> createState() => _AppContactUsViewState();
}

class _AppContactUsViewState extends State<AppContactUsView> {
  TextEditingController firstnameController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {

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
                            onTap: () async {
                              final Uri url = Uri(
                                scheme: 'mailto',
                                path: 'hello@bete-tselot.com',
                              );

                              if (!await launchUrl(url)) {
                                throw Exception('Could not launch $url');
                              }
                            },
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
}
